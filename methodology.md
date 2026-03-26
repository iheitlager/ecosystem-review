# Paper 2 — SLR Methodology & Processing Pipeline

**Paper:** Ecosystem Stewardship Conceptual Framework
**Method:** Systematic Literature Review (Kitchenham & Charters 2007; Tranfield et al. 2003)
**Target journal:** JSIS
**Tools:** paper-scanner (Haiku batch processing) + manual validation

---

## Research Question

How and why do IT suppliers evolve from a vendor role into an ecosystem orchestrator role, and what capabilities enable this transition?

## Phase 1: Search

### 1.1 Search Strings

Three query clusters, each targeting one theoretical pillar:

**Query A — Supplier role evolution:**
```
("IT supplier" OR "IT vendor" OR "service provider" OR "IT partner" OR "outsourcing provider")
AND ("ecosystem" OR "orchestrat*" OR "steward*" OR "co-creation" OR "value creation")
```

**Query B — Dynamic capabilities + external:**
```
("dynamic capabilities" OR "meta-capabilities" OR "higher-order capabilities")
AND ("supplier" OR "vendor" OR "external" OR "boundary-spanning" OR "inter-organizational")
```

**Query C — Ecosystem governance:**
```
("ecosystem" OR "platform ecosystem" OR "innovation ecosystem")
AND ("orchestrat*" OR "governance" OR "coordination" OR "complementor")
AND ("supplier" OR "vendor" OR "partner")
```

### 1.2 Databases

| Database | Coverage | Rationale |
|----------|----------|-----------|
| Scopus | Business, management, IS journals | Primary — broadest coverage of management lit |
| Web of Science | High-impact journals | Complementary — catches ABS 4/4* journals |
| IEEE Xplore | IS/IT-specific | Technical ecosystem and platform papers |

### 1.3 Inclusion / Exclusion Criteria

**Include:**
- Peer-reviewed journal articles and top-tier conference papers
- Published 2005–2026 (Teece 2007 as anchor, but include foundational works from 2005+)
- English language
- Addresses supplier/vendor role in innovation, ecosystems, or capability building

**Exclude:**
- Pure consumer/B2C studies
- Medical, agriculture, education, military domains
- Book reviews, editorials, commentaries
- Papers without theoretical contribution (pure case description)

### 1.4 Implementation

**Tool:** `paper-scanner` fetcher module
- `crossref_handler.py` — DOI resolution and metadata
- `openalex_handler.py` — OpenAlex search and forward citations
- `semantic_scholar_handler.py` — Semantic Scholar API for citation graphs

**Output:** `data/search_results.jsonl` — one record per paper with source database tag

### 1.5 Quality Gate: Search Completeness

| Check | Method | Target |
|-------|--------|--------|
| Seed paper recovery | All 7 key references from paper2_spec.md must appear in results | 7/7 (100%) |
| Database overlap | Venn diagram of results across 3 databases | Report overlap % |
| Date distribution | Histogram of publication years | No suspicious gaps |
| Journal spread | Top 20 journals by frequency | Should include SMJ, AMR, Org Science, JSIS, Research Policy |

---

## Phase 2: Screening

### 2.1 Deduplication

**Tool:** paper-scanner `deduplication` module
- DOI exact match (priority 1)
- Title + author fuzzy match, threshold 0.90 (priority 2)
- Title-only fuzzy match, threshold 0.95 (priority 3)

**KPI:** Deduplication rate — expect 15-30% overlap across databases.

### 2.2 Title/Abstract Screening (automated)

**Tool:** paper-scanner with Haiku batch processing
**Prompt:** Binary relevance classification based on title + abstract against research question.
**Model:** claude-haiku-4-5 (cost-optimized for volume)

Classification:
- **Include** — directly addresses supplier roles, ecosystem orchestration, or capability building across boundaries
- **Maybe** — tangentially relevant, needs full-text check
- **Exclude** — off-topic

**KPI:** Expect ~60-70% exclusion at this stage.

### 2.3 Quality Gate: Screening Reliability (Cohen's Kappa)

**Cohen's Kappa inter-rater reliability test:**

1. Draw a random sample of 50 papers from the screened set
2. Independently screen the sample manually (Ilja)
3. Compare manual classification against Haiku classification
4. Calculate Cohen's Kappa: κ = (Po - Pe) / (1 - Pe)

| κ value | Interpretation | Action |
|---------|---------------|--------|
| > 0.80 | Almost perfect agreement | Proceed |
| 0.60–0.80 | Substantial agreement | Review disagreements, adjust prompt, rerun |
| < 0.60 | Insufficient agreement | Rework prompt, increase sample to 100, retest |

**Target:** κ > 0.80

**Implementation:** Export 50 random papers to CSV, manually classify, script to compute κ.

### 2.4 Full-Text Screening

For papers classified as "Include" or "Maybe":
- Download PDFs (paper-scanner fetcher module)
- Quick scan: does the paper have a theoretical contribution about supplier/vendor roles?
- Final include/exclude decision

**KPI:** Expect 80-150 papers after full-text screening.

---

## Phase 3: Snowballing

### 3.1 Backward Snowballing (references of included papers)

**Tool:** paper-scanner `citations` module (CrossRef API)
- Extract reference lists from included papers
- Filter: journal articles only
- Run through Phase 2 screening pipeline
- Iterate until saturation (< 5% new papers per iteration)
- Max 3 iterations

### 3.2 Forward Snowballing (who cites included papers)

**Tool:** paper-scanner `citations` module (OpenAlex API)
- Find papers citing each included paper
- Filter: journal articles, published up to 2026
- Run through Phase 2 screening pipeline
- 1 iteration (forward snowballing saturates fast)

### 3.3 Quality Gate: Snowball Saturation

| Check | Method | Target |
|-------|--------|--------|
| Saturation curve | Plot new papers per iteration | < 5% new at final iteration |
| Seed recovery | Foundational works (Williamson 1985, Teece 2007, Adner 2017) found via snowball if not in initial search | Must appear |
| Citation network density | Average citations between included papers | Report — higher = more coherent sample |

---

## Phase 4: Data Extraction (CAMO + Theoretical Coding)

### 4.1 Structured Extraction via Haiku

**Tool:** paper-scanner `file_processor.py` with custom prompt
**Model:** claude-haiku-4-5 (batch)

Extract per paper:

**Standard fields:**
- Title, authors, year, journal, DOI
- Research question, methodology, sample/context
- Key findings, limitations

**CAMO framework (existing paper-scanner capability):**
- Context: industry, geography, firm type
- Agency: who acts (supplier, client, platform owner, complementor)
- Mechanism: how they act (capability building, coordination, governance)
- Outcome: what results (innovation, performance, ecosystem health)

**Theoretical coding (new — Paper 2 specific):**
- Supplier role characterization: vendor / partner / orchestrator / steward / platform owner / other
- Theoretical lens used: TCE / RBV / DC / ecosystem / stewardship / agency / institutional / other
- Boundary-spanning: does paper discuss cross-organizational capabilities? Y/N + description
- Ecosystem governance: contractual / relational / platform-based / hybrid / not discussed
- Dynamic capability type: sensing / seizing / transforming / meta / not discussed

**Output:** `data/extracted.jsonl` — one enriched record per paper

### 4.2 Quality Gate: Extraction Accuracy

| Check | Method | Target |
|-------|--------|--------|
| Spot-check accuracy | Manually verify 20 random papers against Haiku extraction | > 90% field accuracy |
| Coding consistency | Re-extract 10 papers, compare outputs | > 85% identical classification |
| Missing data | Count papers with empty required fields | < 5% missing |
| Distribution check | Frequency table of supplier roles and theoretical lenses | No single category > 60% (would indicate coding bias) |

---

## Phase 5: Analysis & Synthesis

### 5.1 Descriptive Analysis

- Publication trend over time (bar chart by year)
- Journal distribution (top 15)
- Methodology distribution (case study, survey, conceptual, etc.)
- Geographic distribution
- Theoretical lens frequency

### 5.2 Thematic Analysis

Group papers by theoretical lens and supplier role characterization:

| Supplier role \ Theory | TCE | DC | Ecosystem | Stewardship | Other |
|----------------------|-----|----|-----------|-----------| ------|
| Vendor | | | | | |
| Partner | | | | | |
| Orchestrator | | | | | |
| Steward | | | | | |

**This matrix IS the gap analysis.** Empty cells = under-theorized areas = the paper's contribution.

### 5.3 Framework Synthesis (interactive — Opus/Sonnet)

This is where the multi-agent pattern applies:

```
extracted.jsonl (Haiku batch output)
        ↓
Agent: Critic (Sonnet/Opus)
  - Reads thematic matrix
  - Identifies contradictions across papers
  - Maps what each stream explains vs. fails to explain
  - Produces gap_analysis.md
        ↓
Agent: Synthesizer (Opus)
  - Reads gap_analysis.md + paper2_spec.md
  - Drafts framework propositions
  - Links mechanisms to theoretical streams
  - Produces framework_draft.md
        ↓
Human review → paper sections
```

### 5.4 Quality Gate: Synthesis Validity

| Check | Method | Target |
|-------|--------|--------|
| Proposition grounding | Every proposition traces to ≥ 3 papers | 100% traceable |
| Gap claim validity | Every "gap" claim verified against thematic matrix | No false gaps |
| Framework completeness | All 4 mechanisms from research plan covered | 4/4 |
| Counter-evidence | Explicitly address papers that contradict the framework | ≥ 1 per proposition |

---

## Pipeline Summary

```
Phase 1: Search          → ~500-1000 raw results
Phase 2: Screen          → ~80-150 included papers
  └ Cohen's κ check      → κ > 0.80 or rework
Phase 3: Snowball        → +20-50 additional papers
  └ Saturation check     → < 5% new at final iteration
Phase 4: Extract (Haiku) → structured JSONL evidence base
  └ Spot-check           → > 90% field accuracy
Phase 5: Synthesize      → gap matrix → framework → propositions
  └ Traceability check   → every claim grounded in ≥ 3 papers
```

## PRISMA Flow Diagram

Will be generated after each phase completes. Standard PRISMA 2020 format:
- Records identified (per database)
- Duplicates removed
- Records screened (title/abstract)
- Records excluded (with reasons)
- Full-text articles assessed
- Studies included in review

---

## Tool Requirements (paper-scanner extensions)

| Capability | Status | Notes |
|-----------|--------|-------|
| BibTeX import (Scopus, WoS, IEEE) | Exists | Tested in archive/ |
| Deduplication (DOI, fuzzy title) | Exists | definition.yml pipeline |
| Keyword screening | Exists | definition.yml pipeline |
| Semantic screening | Exists | sentence-transformers |
| Backward snowballing (CrossRef) | Exists | crossref_handler.py |
| Forward snowballing (OpenAlex) | Exists | openalex_handler.py |
| PDF download | Exists | fetcher.py |
| CAMO extraction (Haiku batch) | Exists | file_processor.py + prompts |
| **Theoretical coding prompt** | **NEW** | Paper 2 specific supplier role + theory lens coding |
| **Cohen's κ calculator** | **NEW** | Compare manual vs. automated screening |
| **PRISMA diagram generator** | **NEW** | Auto-generate from pipeline counts |
| **Thematic matrix builder** | **NEW** | Cross-tab supplier role × theory lens |
| **Spot-check sampler** | **NEW** | Random sample export for manual verification |

---

## Cost Estimate (Haiku batch processing)

Assuming 150 papers, average 8K tokens input + 2K output per paper:
- Screening: 150 × (1K in + 0.2K out) = ~$0.04
- Full extraction: 150 × (8K in + 2K out) = ~$0.60
- Re-runs and iteration: 3× = ~$2
- **Total Haiku cost: < $5**

Synthesis (Opus/Sonnet interactive): variable, but ~$10-20 for the full framework development.
