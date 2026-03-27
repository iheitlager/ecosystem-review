# Phase 0 — The Empirical Puzzle

## The Anomaly

Schuberg Philis (SBP), a Dutch IT services firm, consistently behaves in ways that violate core assumptions of the dominant theories used to explain supplier-client relationships. These behaviors are not exceptions or edge cases — they are the operating model.

The following table maps observed behaviors to the specific theoretical assumptions they violate:

| ID | Observed behavior | Theory violated | Assumption violated | Evidence strength |
|----|-------------------|----------------|---------------------|-------------------|
| A1 | Supplier builds client capabilities without contractual obligation | TCE (Williamson 1985) | Suppliers are opportunistic actors who minimize effort and maximize extraction | Strong (3 cases) |
| A2 | Supplier coordinates competing vendors in client's ecosystem | Agency theory; TCE | Self-interested actors don't help competitors; suppliers minimize coordination with rivals | Strong (3 cases) |
| A3 | Supplier resolves client's internal paradoxes from outside | Paradox theory (Smith & Lewis 2011) | Organizational tensions must be resolved internally by management | Strong (2 cases) |
| A4 | Supplier orchestrates multi-vendor ecosystem without owning the platform | Ecosystem theory (Gawer 2014; Jacobides et al. 2018) | Orchestration requires platform ownership or contractual authority | Moderate (2 cases) |
| A5 | Supplier acts as steward of client interests, not just agent | Stewardship theory (Davis et al. 1997) | Stewardship is intra-firm (managers acting as stewards of owners) | Strong (theoretical) + emerging (demonstrated) |
| A6 | Supplier conducts embedded research inside client to generate shared theory | RBV (Barney 1991) | Firms protect proprietary knowledge as competitive advantage | Strong (2 cases) |
| A7 | Supplier creates public knowledge infrastructure clients can use independently | RBV; TCE | Suppliers build lock-in, not portability | Strong (3 cases) |

---

## Concrete Evidence

### A1: Supplier builds client capabilities without contractual obligation

**Case 1 — NS Train Digitalization: Temporal Coordination Capability**

SBP didn't just implement a CCTV system for Nederlandse Spoorwegen. They built a replicable organizational dynamic capability — "temporally coordinating" — that enables NS to manage the fundamental mismatch between 10-year train design cycles (DDNG frozen in 2023, deployed 2028+) and monthly technology evolution. This capability extends far beyond the contracted scope of a surveillance system.

The IDAM (Iterative Development & Adoption Model) introduced concurrent sourcing strategy across Market Readiness Levels:
- MRL 1-3: internal R&D
- MRL 4-6: co-development with suppliers
- MRL 7-9: external sourcing and integration

TCE predicts suppliers enforce contract boundaries. SBP extended the engagement into teaching NS to think differently about asset-technology roadmaps.

*Source: Paper 1 (published, Designs 9(6), 136). See study/paper_bernard_designs_summary.md*

**Case 2 — Cerqlar/ACT: €25M System Rebuilt in 2 Days**

Lab271 rebuilt Cerqlar's system — representing years and ~€25M investment by a 35-engineer team — in 2 days using AI-driven development. The prototype directly enables Cerqlar's restructuring (35 → 12 engineers) and accelerates product expansion from months to days.

TCE predicts suppliers exit arrangements with negative short-term cost-benefit. SBP built this capability and handed it to Cerqlar.

*Source: work/cerqlar.md, board pitch Apr 2 2026*

**Case 3 — Assured Agentic Engineering: Industry-Standard Framework**

SBP's AAE framework (5 levels, 17 controls) is freely shared with engineers and clients, mapped to open standards (ISO 42001, ISO 15026, IEC 61508, IEC 62443). Target: 100% of SBP colleagues at AAE-3 by summer 2026.

Creating proprietary frameworks would lock clients in. SBP chose alignment with open standards, making the capability transferable. This reduces switching costs — the opposite of what TCE predicts.

*Source: work/aae.md*

---

### A2: Supplier coordinates competing vendors in client's ecosystem

**Case 1 — NS Sourcing Strategy Orchestration**

SBP orchestrated NS's entire vendor selection across MRL 1-9 — choosing when to use internal R&D, when to co-develop with other suppliers, and when to outsource to competing vendors. Decisions were based on what was best for NS, not what maximized SBP margin.

Agency theory assumes suppliers maximize self-interest. SBP selected competing vendors when they were the better fit.

*Source: study/paper_bernard_designs_summary.md*

**Case 2 — Lab271 Cross-Client Innovation Model**

Lab271's "we don't work *for* you, we work *with* you" model explicitly coordinates across client ecosystems: ACT, Tennet, PostNL, EDSN, Enexis, WDO Delta. Six workshops/demos per quarter. The model shares methodologies across clients, creating a portfolio effect where each client learns from others' challenges.

Standard vendor behavior maximizes client lock-in. Lab271 shares insights across competing clients.

*Source: work/lab271.md*

**Case 3 — The Cog: Cross-Functional Incident Coordination**

When the Crisis Management Team needed to process sensitive incident data, SBP assembled a cross-functional response in hours: Onno (infrastructure), Jacob (AI models), Kas (tooling), Luander (security). No formal contracts, no platform governance — implied orchestration through reputation and problem clarity.

*Source: work/the_cog.md*

---

### A3: Supplier resolves client's internal paradoxes from outside

**Case 1 — Cerqlar: Innovation Threatens Internal Credibility**

Cerqlar's 3 developers experienced loss aversion when Lab271's AI prototype replicated their 5 years of work in 2 days. Classic paradox: change threatens the legitimacy of existing work (Smith & Lewis: Change vs. Stability).

SBP resolved this externally using political neutrality: focus on Alex (insider champion) and Jop (decision-maker), not on converting the threatened developers. The resolution strategy drew on Rogers' diffusion curves, Kahneman's loss aversion, and Staw's threat rigidity — but applied from outside the organization.

Smith & Lewis assume paradoxes must be resolved internally via acceptance or integration. SBP resolved it externally through social proof and reframing.

*Source: work/cerqlar.md*

**Case 2 — NS: 10-Year Design vs. Monthly Tech Evolution**

NS faced a fundamental paradox: safety certification requires freezing design a decade before deployment, but digital technology evolves monthly. This Innovation vs. Stability paradox is deeply internal to NS's business model.

SBP's IDAM model resolved it externally by introducing concurrent sourcing — early-stage R&D runs separately from mature-tech integration. NS's internal teams couldn't generate this architectural solution because they were embedded in the paradox.

*Source: study/paper_bernard_designs_summary.md*

---

### A4: Supplier orchestrates without platform ownership

**Case 1 — Lab271 as Non-Owning Orchestrator**

Lab271 operates four innovation labs (Frontier Tech, Strategic Design, Adaptive Architecture, Artificial Intelligence). Each lab works with clients through methodology transfer, shared reference architectures (DRA, IRA), and research partnerships. Lab271 doesn't own client IP, client tools, or client infrastructure.

Ecosystem theory (Gawer 2014, Jacobides et al. 2018) assumes orchestrators own platforms. Lab271 orchestrates via knowledge and methodology — closer to "research consortium orchestration" than platform orchestration. The strategic management literature has no category for this.

*Source: work/lab271.md*

**Case 2 — The Cog: Emergent Orchestration**

The CMT incident response (March 2026) demonstrated orchestration without any formal authority or platform. SBP assembled hardware, AI models, tooling, and security controls across organizational boundaries — not through contracts or platform governance, but through relational trust and shared urgency.

*Source: work/the_cog.md*

---

### A5: Supplier acts as steward of client interests

**Case 1 — Lab271 Frugality Principle**

Lab271 budget: €1.25M, but €50k from company + rest "earned through delivery." Grants: ~€300k/year. The principle is "deserve before you have" — only spend if the client/research partner values what you build.

TCE predicts suppliers maximize revenue extraction. Lab271 inverts this: earn before you spend.

*Source: work/lab271.md*

**Case 2 — AAE: Building Client Independence**

AAE-3 target for summer 2026: all SBP engineers should operate at "Assured" level — spec-driven, agent-centric, evidence-linked. This makes engineers capable of operating independently of SBP as orchestrators. SBP is explicitly teaching engineers to reduce dependency on SBP.

Supplier lock-in requires keeping clients dependent. AAE explicitly aims for client autonomy.

*Source: work/aae.md*

---

### A6: Supplier conducts embedded research to generate shared theory

**Case 1 — NS Case Study Published as Academic Paper**

Paper 1 (Designs 9(6), 2025) is co-authored by Ilja Heitlager (SBP CIO) + Bernard Jenniskens (Lab271). The research was conducted inside NS as participant-observer, including site visits to the Central Surveillance Center and Team Optic. SBP turned a delivery project into publishable academic theory.

RBV assumes firms protect proprietary knowledge. SBP published the IDAM model, making it available to competitors.

*Source: study/paper_bernard_designs_summary.md*

**Case 2 — Master Student Pipeline**

Lab271 recruits 5 master students per cohort (Jan 2026, Sep 2026) for thesis research through TU Eindhoven, VU Amsterdam, and TU Delft. Suppliers don't typically operate as research institutions. SBP blurs the boundary between service delivery and academic research.

*Source: work/lab271.md, study/ecosystem_stewardship_plan_summary.md*

---

### A7: Supplier creates public knowledge infrastructure

**Case 1 — OpenSpec/ADR Tooling**

Lab271 builds sheerpower (spec format tooling), code-analyzer (code analysis), and ADR infrastructure — all designed to work in client projects, not locked to SBP.

*Source: work/aae.md, work/lab271.md*

**Case 2 — AAE Mapped to Open Standards**

AAE is explicitly mapped to published standards: ISO/IEC 42001, ISO/IEC 15026, IEC 61508, IEC 62443. Clients can audit SBP compliance against these standards. The framework is verifiable and portable.

Suppliers typically create proprietary maturity models to lock in consulting revenue. SBP uses open standards.

*Source: work/aae.md*

---

## Quality Gate Assessment

### Gate 1: Is the anomaly real?

| Criterion | Assessment |
|-----------|-----------|
| At least 3 concrete examples | **PASS** — 17 concrete examples across 7 anomaly types |
| Multiple client contexts | **PASS** — NS, Cerqlar/ACT, Tennet, PostNL, internal (CMT) |
| Examples go beyond one person's claim | **PARTIAL** — Paper 1 is peer-reviewed and published. Other examples are internal observations. Paper 3 (survey) will strengthen this. |

### Gate 2: Is it genuinely anomalous?

| Theory | Specific assumption violated | Could theory accommodate with minor extension? |
|--------|-------|-------|
| TCE | Opportunism (Williamson 1985, Ch. 2) | No — opportunism is a foundational behavioral assumption, not a parameter. Relaxing it fundamentally changes TCE. |
| Agency theory | Self-interest of agents | Partially — behavioral agency theory relaxes this, but doesn't address inter-organizational stewardship. |
| Paradox theory | Internal resolution (Smith & Lewis 2011, p. 391) | No — external resolution agent is not theorized. Would require new construct. |
| Ecosystem theory | Platform ownership (Gawer 2014, Table 1) | No — non-platform orchestrators are not a category. Adding them changes the typology. |
| Stewardship theory | Intra-firm (Davis et al. 1997, p. 24) | Partially — could extend to inter-organizational, but this hasn't been done. |
| RBV | Knowledge protection (Barney 1991) | Yes — open innovation literature partially addresses this. But not the supplier-as-researcher role. |

### Gate 3: Is it non-trivial?

| Test | Assessment |
|------|-----------|
| Could existing theory explain this with minor extension? | **NO for A1-A5.** Each requires relaxing a core assumption, not adjusting a parameter. |
| Does it require a new construct? | **YES** — no single existing construct captures the combination of stewardship motive + external capability building + non-platform orchestration + paradox resolution. |
| Is this just "good service"? | **NO** — "good service" is delivering what's contracted. These behaviors go beyond contract scope, sometimes against short-term supplier interest. |
| What about "strategic alliance"? | Alliances are symmetrical. The steward-client relationship is asymmetric — the steward serves the client's interest, absorbs more risk, and builds capabilities for the client to use independently. |

---

## Theories Violated — Summary Matrix

| Theory | Anomalies | Core assumption that blocks explanation |
|--------|-----------|----------------------------------------|
| **TCE (Williamson)** | A1, A2, A5, A7 | Opportunism — suppliers maximize self-interest |
| **Agency theory** | A2, A5 | Self-interest — agents serve own interests unless governed |
| **Dynamic Capabilities (Teece)** | A1 | Internal control — capabilities operate within firm boundaries |
| **Paradox theory (Smith & Lewis)** | A3 | Internal resolution — tensions resolved by insiders |
| **Ecosystem theory (Gawer, Jacobides)** | A4 | Platform ownership — orchestration requires ownership |
| **Stewardship theory (Davis et al.)** | A5 | Intra-firm — stewardship between owners and managers |
| **RBV (Barney)** | A6, A7 | Knowledge protection — firms guard proprietary knowledge |

---

## What This Means for the Paper

The original paper2_spec.md identified 3 theoretical streams (TCE, DC, Ecosystem) plus Stewardship as a bridge. The anomaly analysis adds:

1. **Paradox theory** as a violated stream (A3) — not just context, but a theory whose assumptions are directly challenged.
2. **RBV** as a violated stream (A6, A7) — the knowledge-sharing behavior contradicts resource protection.
3. **Two new anomaly types** (A6, A7) — research partnership and public infrastructure — that weren't in the original spec but are well-evidenced.

The paper's literature streams (Section 3) should cover:
- TCE → violated by A1, A2, A5, A7
- DC → violated by A1 (and extended by the meta-DC construct)
- Ecosystem theory → violated by A4
- Stewardship theory → extended from intra-firm to inter-organizational (A5)
- Paradox theory → violated by A3
- RBV → violated by A6, A7 (possibly fold into DC discussion)

The construct "Ecosystem Stewardship" must explain all 7 anomalies, not just the original 5.
