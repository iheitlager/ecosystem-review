# Phase 0 — The Empirical Puzzle

## The Structural Context: The Mid-Size Squeeze

Before examining the behavioral anomaly, consider the structural market pressure that shapes it.

The IT services industry is being compressed from four directions simultaneously:

```
Hyperscalers             Large Integrators         Product Vendors           Generative AI
(AWS, Azure, GCP)        (Accenture, TCS, Cap)     (Oracle, SAP, ServiceNow) (ChatGPT, Claude, Copilot)
        ↓                        ↓                         ↓                        ↓
Commoditize WHERE        Commoditize WHO           Commoditize WHAT          Commoditize HOW & WHY
things run               builds things             gets built                things are decided
        ↓                        ↓                         ↓                        ↓
        └────────────────────────┴─────────────────────────┴────────────────────────┘
                                                ↓
                             Specialist IT firms without platform ownership
                             (SBP, Xebia, Conclusion, etc.)
```

### What Each Layer Is Doing

**Hyperscalers** are moving up the stack. AWS, Azure, and GCP no longer just sell infrastructure — they offer managed AI services (Vertex AI, Azure OpenAI, Bedrock), industry-specific solutions, and increasingly, orchestration capabilities. Every layer they add absorbs work that specialist firms used to do. Google's Gemini agents and Amazon's Bedrock agents are the platform becoming the orchestrator.

**Large integrators** are scaling horizontally. Accenture alone acquires dozens of specialist firms per year. TCS, Infosys, and Capgemini build proprietary delivery platforms and AI practices that standardize what boutique firms once differentiated on. Their competitive advantage is talent pool depth and global delivery — not client intimacy.

**Product vendors** are closing the gap. Oracle's autonomous database, SAP's AI-native S/4HANA, ServiceNow's platform automation — each release reduces the need for custom integration and specialist middleware knowledge. The SaaS model accelerates this: clients subscribe directly to the vendor, bypassing the integrator entirely. What was once a custom implementation project becomes a configuration exercise. The vendor is becoming self-sufficient, and the specialist firm loses the implementation revenue that funded its expertise.

**Generative AI** commoditizes knowledge work itself — the highest-margin activity in IT services. Strategy advice, architecture reviews, code generation, security assessments, compliance analysis: all activities that specialist firms charged premium rates for because they required human expertise and contextual judgment. A client CIO can now ask Claude for an architecture review before calling a consultant. The knowledge asymmetry that justified the consulting premium is collapsing.

This fourth vector is the most existential because it attacks the core value proposition directly. The other three commoditize infrastructure, labor, and products — things that can be replaced by cheaper alternatives. GenAI commoditizes *reasoning* — the thing that was supposed to be irreplaceable. Software development itself is being compressed: agentic coding means fewer engineers deliver more, and every client will ask why they need a 50-person team when 10 people with AI agents produce the same output.

### The Strategic Vacuum

What's left for the specialist firm?

- Can't compete on **infrastructure** — hyperscalers win on scale, reliability, and price.
- Can't compete on **talent volume** — integrators win on headcount and global reach.
- Can't compete on **product IP** — vendors own the products.
- Can't compete on **generic knowledge** — GenAI delivers expertise at near-zero marginal cost.

The only defensible position is **contextual intimacy** — deep, trust-based understanding of how *this specific client* needs to evolve within *this specific ecosystem*, given *their* politics, *their* legacy, *their* risk appetite, and *their* competitive dynamics. This contextual knowledge is:
- Not transferable to a hyperscaler (too embedded in the client's organizational reality)
- Not replicable by an integrator (requires years of relationship, not months of engagement)
- Not automatable by a product vendor (requires judgment across organizational boundaries)
- Not reproducible by GenAI (requires access to implicit organizational knowledge that doesn't exist in any training corpus — the politics, the trust relationships, the history of failed initiatives, the unspoken constraints)

### Stewardship as Survival, Not Altruism

This reframes the anomaly. The behaviors in A1-A5 are not irrational generosity — they are the **only viable competitive strategy** when extraction leads to commoditization and death. Contextual intimacy — the deep, embedded understanding of a client's ecosystem — is the one asset that appreciates with use rather than depreciating with competition. Every other asset (infrastructure, talent, products, generic knowledge) is being commoditized. This one compounds.

- **Building client capabilities** (A1) makes the client dependent on your *contextual knowledge*, not your platform — a dependency that deepens with every interaction rather than eroding with competition.
- **Coordinating competitors** (A2) makes you indispensable as the integrator of the ecosystem — a role hyperscalers can't fill (they're one of the vendors being integrated), integrators don't fill (they'd rather replace the competitors with their own people), and GenAI can't fill (it lacks the relational access).
- **Resolving internal paradoxes** (A3) creates value that only an outsider with deep insider knowledge can provide — the definition of a non-substitutable resource. GenAI can analyze the paradox; it cannot navigate the politics.
- **Orchestrating without platform ownership** (A4) sidesteps the platform trap — you don't need to outbuild AWS, you need to outthink them at the client-specific level.
- **Acting as steward** (A5) compounds the relationship — every stewardship act increases trust, which increases access, which increases contextual knowledge, which increases value. This is the flywheel that extraction destroys and that no technology can replicate.

### Theoretical Implications

This structural argument connects to:

- **Industry architecture theory** (Jacobides, Knudsen & Augier 2006) — value migrates across layers. The mid-size squeeze is a value migration event.
- **Strategic positioning** (Porter 1996) — stuck in the middle is death; stewardship is a distinct strategic position, not a halfway house.
- **Cospecialization** (Teece 2007) — the steward's asset is cospecialized with the client's ecosystem. It appreciates with use rather than depreciating.

### Boundary Conditions This Creates

Stewardship should work when:
- Client ecosystem is complex (multi-vendor, multi-technology)
- Client lacks internal capability to orchestrate (capability gap)
- Relationship is long-term and trust-based (repeated interaction)
- Supplier has deep domain knowledge across similar clients (portfolio effect)

Stewardship should fail when:
- Service is commoditized enough for hyperscaler or integrator to absorb
- Client has sufficient internal capability (no need for external steward)
- Relationship is transactional or short-term (no trust accumulation)
- Regulatory or procurement rules force competitive tendering (no relationship continuity)

---

## The Anomaly

Schuberg Philis (SBP), a Dutch IT services firm, consistently behaves in ways that violate core assumptions of the dominant theories used to explain supplier-client relationships. These behaviors are not exceptions or edge cases — they are the operating model. The structural context above suggests these behaviors may be strategically rational — but existing theory has no framework to explain *how* or *why* they work.

The following table maps observed behaviors to the specific theoretical assumptions they violate:

| ID | Observed behavior | Theory violated | Assumption violated | Evidence strength |
|----|-------------------|----------------|---------------------|-------------------|
| A1 | Supplier builds client capabilities without contractual obligation | TCE (Williamson 1985) | Suppliers are opportunistic actors who minimize effort and maximize extraction | Strong (3 cases) |
| A2 | Supplier coordinates competing vendors in client's ecosystem | Agency theory; TCE | Self-interested actors don't help competitors; suppliers minimize coordination with rivals | Strong (3 cases) |
| A3 | Supplier resolves client's internal paradoxes from outside | Paradox theory (Smith & Lewis 2011) | Organizational tensions must be resolved internally by management | Strong (2 cases) |
| A4 | Supplier orchestrates multi-vendor ecosystem without owning the platform | Ecosystem theory (Gawer 2014; Jacobides et al. 2018) | Orchestration requires platform ownership or contractual authority | Moderate (2 cases) |
| A5 | Supplier acts as steward of client interests, not just agent | Stewardship theory (Davis et al. 1997) | Stewardship is intra-firm (managers acting as stewards of owners) | Strong (theoretical) + emerging (demonstrated) |


*A6 and A7 from earlier analysis (research partnership, public infrastructure) are folded into A1 and A5 as supporting evidence — they are consequences of stewardship behavior, not separate anomaly types. The RBV violations they represent are real but secondary to the core theoretical pillars (TCE, DC, Ecosystem, Stewardship, Paradox).*

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

## Generalizability: Beyond SBP

All concrete examples above come from SBP. This is sufficient for a *motivating case* — establishing that the phenomenon is real — but insufficient for claiming generality. The paper needs to address this honestly.

### Candidate Firms (Dutch, mid-size, similar profile)

- **Xebia** — knowledge-sharing model (Xebia Academy, open conferences, methodology transfer). Builds client capabilities beyond contract scope. Federated structure with specialized practices. *Candidate for stewardship behavior — unverified.*
- **Conclusion** — federated model with specialized units, "work with" culture. Similar scale and philosophy to SBP. *Candidate — unverified.*

These firms may exhibit similar patterns but without insider access or published case data, naming them as evidence would be overclaiming. The honest framing: "firms that may exhibit similar patterns, flagged as empirical targets for Paper 3 (survey validation)."

### Structural Contrast: Platform vs. Non-Platform Orchestration

Large consulting/IT firms (Accenture, Capgemini, Infosys) operate as **platform orchestrators** — proprietary methodologies, tools, talent pools, and delivery frameworks create structural dependency as a side effect of scale. This is well-theorized in ecosystem literature (Gawer 2014).

Mid-size specialist firms (SBP, potentially Xebia, Conclusion) orchestrate **without** platform ownership. The research question is not "who is better" but: **what governance mechanism replaces the platform when the orchestrator doesn't own one?** That's the theoretical gap.

Note: the author is CIO at SBP. This is insider practitioner research (Brannick & Coghlan 2007). The position creates unique access to the phenomenon but also requires reflexivity about bias. The paper must acknowledge this explicitly and use the SLR as a counterweight — the literature review is independent of the author's firm.

---

## The Gap: Empirical vs. Theoretical

A critical distinction for the abductive argument:

**Empirical gap** = "nobody has observed this behavior."
**Theoretical gap** = "the behavior has been observed but no theory explains it."

The SLR will NOT find an empty cell. It will find papers that:

1. **Describe** suppliers doing steward-like things (empirical observations without adequate theory)
2. **Use adjacent concepts** (boundary-spanning, co-creation, relational governance, strategic partnership) that capture *parts* of the phenomenon but miss the whole
3. **Get close but stop short** — because their theoretical lens (TCE, DC, ecosystem) has an assumption that blocks them from seeing the full picture

Papers that *almost* describe Ecosystem Stewardship but can't name it — because their theory doesn't have the construct — are the **strongest evidence** for the gap. They prove the phenomenon exists AND that existing theory can't capture it.

### What the SLR Should Reveal

| Finding | What it means |
|---------|--------------|
| Papers describing steward-like behavior, explained via TCE | Misclassified — TCE lens forces "strategic self-interest" interpretation onto benevolent behavior |
| Papers on boundary-spanning capabilities | Adjacent concept — captures the "across boundaries" part but not the "stewardship motive" |
| Papers on co-creation | Adjacent concept — captures collaboration but assumes symmetry, misses the asymmetric steward role |
| Papers on ecosystem orchestration by non-platform actors | Closest match — but likely rare and under-theorized |
| Zero papers combining all 5 anomaly dimensions | The theoretical gap — the construct space is genuinely empty |

The quality gate is NOT "zero papers found." It's: **no existing construct captures the combination of (1) stewardship motive + (2) external capability building + (3) non-platform orchestration + (4) paradox resolution + (5) cross-boundary dynamic capabilities.**

Individual papers may cover 1-2 dimensions. The gap is at the intersection.

---

## Theories Violated — Summary Matrix

| Theory | Anomalies | Core assumption that blocks explanation |
|--------|-----------|----------------------------------------|
| **TCE (Williamson)** | A1, A2, A5 | Opportunism — suppliers maximize self-interest |
| **Dynamic Capabilities (Teece)** | A1 | Internal control — capabilities operate within firm boundaries |
| **Paradox theory (Smith & Lewis)** | A3 | Internal resolution — tensions resolved by insiders |
| **Ecosystem theory (Gawer, Jacobides)** | A4 | Platform ownership — orchestration requires ownership |
| **Stewardship theory (Davis et al.)** | A5 | Intra-firm — stewardship between owners and managers |

### On RBV

The evidence scan surfaced RBV violations (publishing proprietary research, building open tools). These are real but secondary — they are *consequences* of stewardship behavior (A1, A5), not independent anomalies. Including RBV as a sixth theoretical stream would dilute the argument. The paper challenges five theories; that's enough.

RBV violations can serve as supporting evidence within A1 (capability building includes knowledge sharing) and A5 (stewardship includes building client independence through open infrastructure). They belong in the discussion section as "additional implications" — not in the core argument.

---

## What This Means for the Paper

The anomaly analysis confirms the original paper2_spec.md's four theoretical streams and adds one:

1. **TCE** → violated by A1, A2, A5 (the core clash — opportunism vs. stewardship)
2. **Dynamic Capabilities** → violated by A1 (extended by the meta-DC construct)
3. **Ecosystem theory** → violated by A4 (non-platform orchestration)
4. **Stewardship theory** → extended from intra-firm to inter-organizational (A5)
5. **Paradox theory** → violated by A3 (not just context, but a theory whose assumptions are directly challenged)

The construct "Ecosystem Stewardship" must explain all 5 anomalies. The SLR (Phases 1-4) tests whether this theoretical gap holds — not by finding zero papers, but by finding papers that describe the behavior without being able to theorize it.
