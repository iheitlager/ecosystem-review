# Paper 2: Ecosystem Stewardship — Rapid Development Plan

**Project:** Systematic Literature Review + Conceptual Framework
**Target:** Journal of Strategic Information Systems (JSIS)
**Authors:** Ilja Heitlager, A. Georges L. Romme
**Deadline:** Q2 2026
**Start:** Week of 2026-03-31

---

## Vision

Build an end-to-end pipeline that goes from raw academic databases to a publishable
literature review paper. The approach is **rapid and AI-augmented**: use automation
for collection, screening, synthesis, and first-draft generation — then apply human
judgment for theory building and argument refinement.

## Thesis

IT suppliers that develop meta-dynamic capabilities evolve from transactional vendors
into ecosystem orchestrators — a role strategic management literature hasn't theorized
because it assumes suppliers are value extractors, not value enablers.

## Core Question

How and why do IT suppliers evolve from a vendor role into an ecosystem orchestrator
role, and what capabilities enable this transition?

---

## Architecture: Three Phases

### Phase 1: Collect (weeks 1-2)

**Goal:** Assemble a comprehensive, deduplicated corpus of relevant papers.

#### 1.1 Define Search Strategy
- **Databases:** Scopus, Web of Science, IEEE Xplore (already configured)
- **Date range:** 2010–2025 (extend from current 2015–2024 to catch foundational work)
- **Search strings** — three parallel queries mapped to the three literature streams:
  - **Stream A (TCE/Governance):** `("transaction cost*" OR "governance" OR "outsourc*") AND ("supplier*" OR "vendor*") AND ("digital*" OR "innovation" OR "ecosystem")`
  - **Stream B (Dynamic Capabilities):** `("dynamic capabilit*" OR "meta-capabilit*" OR "orchestrat*") AND ("supplier*" OR "vendor*" OR "ecosystem") AND ("digital*" OR "innovat*")`
  - **Stream C (Ecosystem Strategy):** `("ecosystem" OR "platform" OR "complementor*") AND ("orchestrat*" OR "steward*" OR "coordinat*") AND ("digital*" OR "innovat*" OR "transform*")`
- **Supplementary stream (Stewardship Theory):**
  `("stewardship theory" OR "stewardship behavio*") AND ("supplier*" OR "vendor*" OR "partner*" OR "ecosystem")`

#### 1.2 Import & Deduplicate
- Export from each database → BibTeX
- Import via existing `builtin.bibtex_import` pipeline
- Deduplicate on DOI (exact), then title+author (fuzzy ≥0.90), then title (fuzzy ≥0.95)
- **Target:** 800–1500 raw papers → 400–800 after dedup

#### 1.3 Snowball
- Forward + backward citation chasing from seed papers (key references in paper2_spec.md)
- Use OpenAlex and CrossRef APIs (already configured)
- 2–3 iterations, saturation threshold 5%

#### Deliverable
- `db/corpus.sqlite` — deduplicated paper database with metadata
- `output/corpus_stats.md` — import/dedup/source breakdown

---

### Phase 2: Review (weeks 2-4)

**Goal:** Screen, code, and synthesize the corpus into structured evidence.

#### 2.1 Automated Screening
- **Metadata screen:** English only, journal articles, peer-reviewed, DOI required
- **Keyword screen:** exclude off-topic domains (medical, agriculture, military, education)
- **Semantic screen:** SPECTER embeddings + Rocchio classification against research question and dimensions
- **Target:** 400–800 → 80–150 included papers

#### 2.2 Full-Text Analysis (AI-augmented)
- Download PDFs for included papers (`builtin.download_pdfs`)
- For each paper, extract via LLM:
  - **Supplier role characterization** (vendor / partner / orchestrator / steward / other)
  - **Theoretical lens** (TCE / DC / Ecosystem / Stewardship / Other)
  - **Key mechanisms** identified (if any)
  - **Industry context** and **method**
  - **Key findings** (2-3 sentences)
  - **Relevance score** (1-5 for each of the four mechanisms)
- Store extractions as structured JSONL

#### 2.3 Coding & Synthesis
- Build a **coding matrix**: papers × theoretical streams × mechanisms
- Identify:
  - What each stream says about supplier roles
  - Where the gap is (no stream explains supplier-as-steward)
  - Which mechanisms appear in which streams (partial coverage)
  - Evolution patterns (if any papers track vendor → orchestrator transitions)
- Generate **synthesis tables** for each literature stream (Section 3 of the paper)

#### Deliverable
- `output/screening_results.json` — screening decisions with rationale
- `output/paper_extractions.jsonl` — structured full-text extractions
- `output/coding_matrix.csv` — papers × codes
- `output/synthesis/` — per-stream synthesis narratives

---

### Phase 3: Write (weeks 4-6)

**Goal:** Draft the paper, iterating section by section.

#### 3.1 Paper Structure (per paper2_spec.md)

```
1. Introduction
   - Practitioner observation: supplier-as-orchestrator is empirically visible
   - Theoretical gap: no framework explains this role
   - Contribution preview

2. Method: Systematic Literature Review
   - Search strategy (from Phase 1)
   - Screening protocol (from Phase 2)
   - Coding scheme
   - PRISMA flow diagram

3. Literature Streams
   3a. Transaction Cost Economics — supplier as cost center
   3b. Dynamic Capabilities — internal focus, no cross-boundary theory
   3c. Ecosystem Strategy — platforms and complementors, not supplier orchestrators
   3d. Stewardship Theory — bridge from agency to benevolent orchestration
   3e. (TBD) Habermas — legitimacy through discourse (include only if strengthens)

4. Conceptual Framework
   - Evolution model: Vendor → Partner → Orchestrator → Steward
   - Meta-dynamic capabilities definition
   - Four mechanisms: External Paradox Resolution, Portfolio Transfer,
     Boundary Management, Innovation Risk Orchestration
   - Testable propositions

5. Discussion
   - What this explains that existing theory cannot
   - Boundary conditions
   - Implications for each literature stream

6. Conclusion
   - Contribution, limitations, empirical agenda → Paper 3
```

#### 3.2 Drafting Approach
- Draft each section using synthesis outputs from Phase 2
- Section 2 (Method) — generated from pipeline configuration + screening stats
- Section 3 (Literature) — generated from per-stream synthesis narratives
- Section 4 (Framework) — human-led with AI structuring support
- Sections 1, 5, 6 — human-led argumentation, AI assists with coherence

#### 3.3 Iteration
- Internal review with Romme after first complete draft
- JSIS formatting and submission guidelines compliance check
- Reference list validation against corpus database

#### Deliverable
- `paper/draft_v1.tex` or `paper/draft_v1.md` — complete first draft
- `paper/references.bib` — curated bibliography
- `paper/figures/` — PRISMA diagram, framework figure, synthesis tables

---

## Open Decisions

| # | Decision | Options | Status |
|---|----------|---------|--------|
| 1 | Search scope date range | 2010-2025 vs 2015-2024 | Proposed: 2010-2025 |
| 2 | Habermas: in or out? | Include as 3e vs. footnote vs. omit | Defer until after SLR |
| 3 | Framework format | Process model vs. typology vs. propositions | Check JSIS conventions |
| 4 | How much SBP? | Pure conceptual vs. motivating case | Discuss with Romme |
| 5 | Paper format | LaTeX vs. Markdown → PDF | TBD |
| 6 | LLM for extraction | Claude API vs. local model | Claude API (speed + quality) |
| 7 | Pipeline tool | Existing paper-scanner or new lightweight scripts | Assess current tool state |

---

## Current State (2026-03-24)

### What Exists
- **Definition configs:** 13 YAML pipeline definitions (Scopus, IEEE, WoS, snowballing)
- **Data collected:** ~15 IEEE PDFs, BibTeX exports from 3 databases
- **Screening pipeline:** keyword + metadata + SPECTER-based semantic screening configured
- **Snowballing:** forward/backward citation chasing via OpenAlex/CrossRef configured
- **Export:** BibTeX + PostgreSQL upload configured
- **APIs:** CORE and IEEE Xplore keys in `.env`

### What's New in This Restart
- **Stream-oriented search strategy** — three parallel queries aligned to Paper 2's three literature gaps (TCE, DC, Ecosystem) instead of one broad query
- **AI-augmented full-text extraction** — LLM-based structured coding of each paper
- **End-to-end pipeline** — from raw databases to draft sections, not just to a BibTeX export
- **Coding matrix** — explicit mapping of papers to theoretical streams and mechanisms
- **Rapid timeline** — 6 weeks from start to complete first draft

---

## Directory Structure (Target)

```
ecosystem-review/
├── .openspec/
│   └── project.md              # This file
├── data/
│   ├── bib/                    # Raw BibTeX exports per database
│   ├── pdf/                    # Downloaded full-text PDFs
│   └── support/                # Citation data, seed papers
├── db/                         # SQLite corpus database
├── output/
│   ├── screening_results.json  # Screening decisions
│   ├── paper_extractions.jsonl # LLM-extracted paper data
│   ├── coding_matrix.csv       # Papers × codes
│   ├── synthesis/              # Per-stream narrative synthesis
│   └── papers_export.bib       # Final curated bibliography
├── paper/
│   ├── draft_v1.md             # Paper draft
│   ├── references.bib          # Paper bibliography
│   └── figures/                # PRISMA, framework diagrams
├── scripts/                    # Pipeline scripts (Python)
├── definition*.yml             # Pipeline configurations
├── pyproject.toml              # Project dependencies
└── Makefile                    # Common tasks
```

---

## Dependencies

- Python 3.12+
- `uv` for package management
- sentence-transformers (SPECTER model for semantic screening)
- Claude API (for full-text extraction and synthesis)
- OpenAlex / CrossRef APIs (for snowballing)
- IEEE Xplore API + CORE API (for paper collection)
- Existing paper-scanner pipeline (assess reusability)
