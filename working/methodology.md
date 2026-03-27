# Paper 2 — Methodology: Abductive Theory Building

**Paper:** Ecosystem Stewardship — A Conceptual Framework
**Method:** Abductive theory building (Dubois & Gadde 2002) using systematic literature review as evidence base
**Tools:** paper-scanner (Haiku batch processing) + interactive synthesis (Opus/Sonnet)

---

## Epistemological Position

This paper is **not** a positivist meta-review. A standard SLR synthesizes what is already known — it deduces patterns from existing findings. That cannot produce a new theoretical construct, because if the construct were in the literature, it wouldn't be new.

This paper uses **abductive reasoning** (Peirce 1903; Dubois & Gadde 2002):

1. **Surprising fact** — IT suppliers (SBP and similar firms) behave in ways that existing theory predicts they shouldn't: building client capabilities without contractual obligation, coordinating competing vendors, resolving clients' internal paradoxes from outside.

2. **Theoretical inadequacy** — a systematic review of the literature demonstrates that no existing theory explains this behavior. TCE assumes opportunism. DC theory assumes internal control. Ecosystem theory assumes platform ownership. Stewardship theory assumes intra-firm agents.

3. **Abductive leap** — if a new construct — *Ecosystem Stewardship* — were true, the surprising behavior makes sense. The paper defines, grounds, and develops this construct.

**The SLR serves step 2: it is evidence of the gap, not the generative method.** The theoretical contribution comes from the abductive reasoning, not from summarizing what others wrote.

### Key Methodological References

- **Dubois & Gadde (2002)** — "Systematic combining" — the abductive case research method
- **Jaakkola (2020)** — "Designing conceptual articles: four approaches" — this paper is "theory synthesis" type
- **Shepherd & Suddaby (2017)** — how to build theory for AMR/AMJ
- **Suddaby (2010)** — construct clarity requirements
- **Whetten (1989)** — what constitutes a theoretical contribution (what, how, why, who/where/when)

---

## The Argument Structure

```
Practitioner anomaly          Systematic literature review
(SBP empirical observation)   (evidence of theoretical inadequacy)
         \                    /
          \                  /
           ↓                ↓
    Abductive inference: Ecosystem Stewardship
                    ↓
    Construct definition (what it is / is not)
                    ↓
    Theoretical mechanisms (the "how")
                    ↓
    Propositions (testable claims)
                    ↓
    Empirical agenda → Paper 3
```

This is **not** linear. Abduction is iterative — the empirical puzzle sharpens the literature search, and the literature search sharpens the construct definition. Dubois & Gadde call this "systematic combining": moving back and forth between framework, data sources, and analysis.

---

## Phase 0: The Empirical Puzzle

Before touching the literature, formally articulate what existing theory cannot explain.

### The Anomaly

| Observed behavior | What theory predicts | Theory violated |
|-------------------|---------------------|-----------------|
| Supplier invests in building client capabilities without contractual obligation | Suppliers minimize effort, maximize extraction (opportunism) | TCE (Williamson 1985) |
| Supplier coordinates competing vendors in client's ecosystem | Self-interested actors don't help competitors | Agency theory, TCE |
| Supplier resolves client's internal paradoxes (e.g., innovation vs. stability) from outside | Organizational tensions are resolved internally by management | Paradox theory (Smith & Lewis 2011) |
| Supplier orchestrates multi-vendor ecosystem without owning the platform | Orchestration requires platform ownership or contractual authority | Ecosystem theory (Gawer 2014, Jacobides 2018) |
| Supplier acts as steward of client interests, not just agent | Stewardship is an intra-firm phenomenon (managers acting as stewards of owners) | Stewardship theory (Davis et al. 1997) |

### Empirical Anchoring

SBP serves as the primary motivating case — not a full case study (that's Paper 3), but an empirical vignette showing the phenomenon is real. Ideally 2-3 additional firms cited briefly to show this isn't a single-firm anomaly.

**Deliverable:** `anomaly.md` — structured description of the puzzle with specific examples.

### Quality Gate: Puzzle Validity

| Check | Method | Target |
|-------|--------|--------|
| Is the anomaly real? | Verify with practitioner evidence (SBP, interviews, project data) | At least 3 concrete examples |
| Is it genuinely anomalous? | Check each "theory violated" claim against source papers | Each violation traces to specific theoretical assumptions |
| Is it non-trivial? | Could existing theory explain this with minor extension? | Must require new construct, not just parameter change |

---

## Phase 1: Search

The SLR's purpose is twofold:
1. **Map the landscape** — what does existing theory say about supplier roles?
2. **Demonstrate the gap** — show systematically that no existing stream explains the anomaly.

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
| Journal spread | Top 20 journals by frequency | Should include SMJ, AMR, Org Science, Research Policy |

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

## Phase 4: Data Extraction — Theoretical Coding

### Purpose Shift

In a positivist SLR, extraction captures "what the paper found." Here, extraction is designed to answer: **how does each paper characterize the supplier role, and which theoretical assumptions does it make?**

The coding scheme is built from the anomaly table in Phase 0. For each paper, we ask: does this paper address the anomaly? Does it explain any of the surprising behaviors? If not, why not — what assumption blocks it?

### 4.1 Dual-Pass Extraction via Haiku

**Tool:** paper-scanner `file_processor.py` with two prompts
**Model:** claude-haiku-4-5 (batch)

**Pass 1 — Standard extraction** (existing paper-scanner prompt: `paper-summary.md`):
- Title, authors, year, journal, DOI
- Research question, methodology, sample/context
- Key findings, limitations
- CAMO framework (Context-Agency-Mechanism-Outcome) — retained as secondary extraction for empirical patterns
- Theoretical frameworks used

**Pass 2 — Theoretical inadequacy coding** (new prompt: `prompts/theoretical-coding.md`):
This is the primary coding for Paper 2. It captures what each paper ASSUMES, not just what it FINDS.

- **Theoretical lens:** primary and secondary streams (TCE, DC, ecosystem, stewardship, paradox, etc.)
- **Supplier role:** vendor / partner / orchestrator / steward / platform owner / complementor / not discussed — plus the paper's own term
- **Supplier motive assumed:** opportunistic / self-interested / neutral / collaborative / benevolent — with evidence quote
- **Capability scope:** internal only / inter-organizational / meta-capabilities / not discussed
- **Orchestration mode:** platform-based / contractual / relational / hierarchical / hybrid / not discussed
- **Anomaly coverage:** for each of A1-A5, does the paper address / describe / contradict / stay silent? Score 0-5.
- **Blocking assumption:** what theoretical assumption prevents this paper from explaining ecosystem stewardship?
- **Nearest concept:** what concept comes closest? What does it miss?
- **Evidence value:** gap evidence / partial support / mechanism support / counter-evidence / context only

The anomaly coverage and blocking assumption fields directly build the thematic matrix and gap argument.
- **Boundary-spanning:** does paper discuss cross-organizational capabilities? Y/N + description
- **Ecosystem governance mode:** contractual / relational / platform-based / hybrid / not discussed
- **Dynamic capability scope:** internal only / inter-organizational / meta (operates on others' capabilities) / not discussed
- **Anomaly coverage:** which rows from the Phase 0 anomaly table does this paper address? (0-5)

**Output:** `data/extracted.jsonl` — one enriched record per paper

### 4.2 Quality Gate: Extraction Accuracy

| Check | Method | Target |
|-------|--------|--------|
| Spot-check accuracy | Manually verify 20 random papers against Haiku extraction | > 90% field accuracy |
| Coding consistency | Re-extract 10 papers, compare outputs | > 85% identical classification |
| Missing data | Count papers with empty required fields | < 5% missing |
| Distribution check | Frequency table of supplier roles and theoretical lenses | No single category > 60% (would indicate coding bias) |
| Anomaly coverage | How many papers address 0 anomaly rows vs. 1+ | Expect majority at 0 — that IS the gap |

---

## Phase 5: Abductive Synthesis

This is where the paper's contribution happens. Phases 1-4 build the evidence base. Phase 5 builds the theory.

### 5.1 Demonstrating Theoretical Inadequacy

For each theoretical stream, produce a structured argument:

**Template per stream:**

```
Stream: [e.g., Transaction Cost Economics]
Core assumption: [e.g., suppliers are opportunistic actors]
What it explains: [specific papers from SLR that use this lens successfully]
What it cannot explain: [which anomaly rows remain unaddressed]
Why it fails: [the specific assumption that blocks explanation]
What would need to change: [the assumption that must be relaxed]
```

**The thematic matrix (supplier role × theoretical lens)** visualizes this. Empty or sparse cells = under-theorized areas.

| Supplier role \ Theory | TCE | DC | Ecosystem | Stewardship | Gap? |
|----------------------|-----|----|-----------|-----------| -----|
| Vendor | dense | some | some | rare | No |
| Partner | some | some | some | rare | Partial |
| Orchestrator | empty | rare | some | empty | **YES** |
| Steward | empty | empty | empty | rare (intra-firm only) | **YES** |

**Quality Gate:** Every "empty" or "gap" cell must be verified — can we really not find papers? Or did the search miss them? Re-run targeted searches for suspicious gaps.

### 5.2 Construct Definition — Ecosystem Stewardship

Following Suddaby (2010) construct clarity requirements:

**A. What it is:**
- Definition: [one paragraph]
- Constituent dimensions: the 4 mechanisms (External Paradox Resolution, Portfolio Transfer, Boundary Management, Innovation Risk Orchestration)
- Level of analysis: inter-organizational (supplier-client-ecosystem)

**B. What it is not (discriminant validity):**
- Not platform ownership (Gawer) — steward doesn't own the platform
- Not outsourcing (TCE) — steward builds client capability, not just delivers service
- Not consulting (advisory) — steward has operational skin in the game
- Not alliance (symmetrical) — steward-client relationship is asymmetric (steward serves client's interest)

**C. Boundary conditions (when it works / fails):**
- Works: trust, repeated interaction, complex multi-vendor ecosystem, client capability gap
- Fails: power asymmetry, commoditized services, adversarial relationship, regulatory barriers

**D. Relationship to existing constructs:**
- Extends Dynamic Capabilities (Teece): meta-DCs that operate across organizational boundaries
- Extends Stewardship Theory (Davis et al.): from intra-firm to inter-organizational
- Challenges TCE (Williamson): supplier as value enabler, not value extractor
- Fills gap in Ecosystem Theory (Adner, Jacobides): the non-platform orchestrator

### 5.3 Theoretical Mechanisms

Each mechanism needs:

| Element | Content |
|---------|---------|
| **Definition** | What it is, precisely |
| **Theoretical root** | Which existing theory it extends |
| **What it extends** | The specific assumption it relaxes or capability it adds |
| **How it operates** | The causal logic |
| **Observable indicators** | What you'd see empirically (sets up Paper 3) |
| **SLR grounding** | Which papers provide partial support or adjacent concepts |

**Mechanism 1: External Paradox Resolution**
- Root: Paradox theory (Smith & Lewis 2011)
- Extends: adds external resolution agent — some paradoxes are inherently irresolvable from within
- Operates: supplier's political neutrality + cross-client pattern recognition enables solutions invisible to insiders

**Mechanism 2: Portfolio Transfer**
- Root: Dynamic capabilities (Teece 2007)
- Extends: adds cross-boundary capability operation — learn through guided practice across client portfolio
- Operates: supplier accumulates patterns across clients, transfers capability (not just knowledge) to each

**Mechanism 3: Boundary Management**
- Root: Boundary spanning (Tushman 1977)
- Extends: adds stewardship motive — protecting client interests while enabling capability growth
- Operates: supplier manages the boundary between enabling and controlling, absorbs risk of capability transfer

**Mechanism 4: Innovation Risk Orchestration**
- Root: Ecosystem governance (Jacobides 2018)
- Extends: adds non-platform orchestrator — multi-stakeholder risk alignment without contractual authority
- Operates: supplier aligns innovation risks across client, other vendors, and itself through relational governance

### 5.4 Propositions

Testable claims linking mechanisms to outcomes. Not hypotheses (not tested here — that's Paper 3).

**Requirements per proposition:**
- Traces backward to SLR evidence (≥ 3 papers supporting the premises)
- Traces forward to testable implications (what empirical pattern would confirm/disconfirm)
- Explicitly states boundary conditions
- Addresses counter-evidence (papers that contradict or limit the claim)

### 5.5 Multi-Agent Processing for Synthesis

```
Phase 4 output: extracted.jsonl (structured evidence base)
                        ↓
    Agent: Critic (Sonnet/Opus)
      - Reads thematic matrix + anomaly table
      - For each theoretical stream: what does it explain vs. fail to explain?
      - Identifies contradictions across papers
      - Finds papers that come closest to the construct without naming it
      - Produces inadequacy_analysis.md
                        ↓
    Agent: Synthesizer (Opus)
      - Reads inadequacy_analysis.md + paper2_spec.md + anomaly.md
      - Drafts construct definition following Suddaby (2010)
      - Develops mechanism definitions
      - Formulates propositions with traceability
      - Produces framework_draft.md
                        ↓
    Human review → iterate → paper sections
```

### 5.6 Quality Gate: Theory Validity

| Check | Method | Target |
|-------|--------|--------|
| Construct clarity | Does definition pass Suddaby (2010) criteria? (what/not/boundary/relation) | All 4 elements present |
| Proposition grounding | Every proposition traces to ≥ 3 papers | 100% traceable |
| Gap claim validity | Every "gap" claim verified against thematic matrix | No false gaps |
| Mechanism completeness | All 4 mechanisms defined with all 6 elements | 24/24 elements |
| Counter-evidence | Explicitly address papers that contradict each proposition | ≥ 1 per proposition |
| Parsimony | Could fewer mechanisms explain the same phenomenon? | Justify why 4, not 3 or 5 |
| Novelty | Is this genuinely new, or a relabeling of existing concepts? | Each mechanism must differ from nearest existing concept |

---

## Pipeline Summary

```
Phase 0: Empirical puzzle     → anomaly.md (what theory can't explain)
Phase 1: Search               → ~500-1000 raw results
Phase 2: Screen               → ~80-150 included papers
  └ Cohen's κ check           → κ > 0.80 or rework
Phase 3: Snowball             → +20-50 additional papers
  └ Saturation check          → < 5% new at final iteration
Phase 4: Extract (Haiku)      → structured JSONL evidence base
  └ Spot-check                → > 90% field accuracy
Phase 5: Abductive synthesis  → inadequacy → construct → mechanisms → propositions
  └ Suddaby check             → construct clarity criteria met
  └ Traceability check        → every claim grounded in ≥ 3 papers
  └ Counter-evidence check    → contradictions addressed
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
| **Theoretical coding prompt** | **NEW** | Supplier role + theory lens + anomaly coverage coding |
| **Cohen's κ calculator** | **NEW** | Compare manual vs. automated screening |
| **PRISMA diagram generator** | **NEW** | Auto-generate from pipeline counts |
| **Thematic matrix builder** | **NEW** | Cross-tab supplier role × theory lens, highlight gaps |
| **Spot-check sampler** | **NEW** | Random sample export for manual verification |
| **Anomaly coverage scorer** | **NEW** | Per-paper score: how many anomaly rows addressed |

---

## Cost Estimate (Haiku batch processing)

Assuming 150 papers, average 8K tokens input + 2K output per paper:
- Screening: 150 × (1K in + 0.2K out) = ~$0.04
- Full extraction: 150 × (8K in + 2K out) = ~$0.60
- Re-runs and iteration: 3× = ~$2
- **Total Haiku cost: < $5**

Synthesis (Opus/Sonnet interactive): variable, ~$10-20 for the full framework development.
