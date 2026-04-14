# CORE-LAWS.md — The Six Immutable Laws of Research Writing
# Domain-agnostic. Referenced by all skills. Never duplicated.
# Version: 2.0.0

These six laws govern every paragraph produced by any skill in the system.
No skill, workflow, or domain module may override or weaken them.

---

## Law 1 — RQ Traceability

Every paragraph contains or traces to an explicit Research Question.
Orphan paragraphs — those serving no RQ — are forbidden.

Enforcement: each paragraph's topic sentence must connect to RQ1, RQ2, or RQ3
as declared in PROJECT-CONFIG.md. If a paragraph cannot be traced, delete it
or reassign it to a valid RQ.

---

## Law 2 — No Fluff

Every sentence must advance the argument. Forbidden phrases:

- "It is important to note"
- "As mentioned previously"
- "In today's world"
- "I believe / We believe"
- "Obviously / Clearly"
- "This study aims to explore"
- "It goes without saying"
- "Needless to say"

If a sentence can be removed without losing information, remove it.

---

## Law 3 — Register

### Contractions
Forbidden. "don't" -> "do not", "can't" -> "cannot", "it's" -> "it is".

### First Person
Forbidden in Methods and Results sections.
Limited use in Discussion and Conclusion ("This study demonstrates...").

### Vague Quantifiers
Forbidden. "many" -> "numerous"; "a lot" -> "a significant proportion";
"some" -> "several" or a specific count.

### Tense Rules
| Section       | Tense          | Example                                    |
|---------------|----------------|--------------------------------------------|
| Methods       | Past           | "The model was trained for 100 epochs"     |
| Results       | Past           | "A significant difference was observed"    |
| Literature    | Present        | "Wang et al. (2023) demonstrate..."        |
| Discussion    | Present        | "The findings suggest..."                  |
| Conclusion    | Present perfect | "This study has demonstrated..."          |

---

## Law 4 — Citation Integrity

- Every factual claim requires an APA 7th in-text citation
- Parenthetical: (Author et al., Year)
- Narrative: Author et al. (Year)
- No citation available: flag with `[CITATION NEEDED: claim-type]`
- Citation style override: check PROJECT-CONFIG.md `citation_style` field
- Never fabricate a citation — use citation-checker to verify

---

## Law 5 — Voice Discipline

| Section         | Voice    | Rule                                           |
|-----------------|----------|-------------------------------------------------|
| Methods         | Passive  | "The dataset was collected..." (not "We collected") |
| Results         | Passive  | "Significant differences were observed..."     |
| Discussion      | Mixed    | Active for interpretation, passive for framing |
| Topic sentences | Active   | NEVER passive — must be declarative and direct |

---

## Law 6 — T-C-E-L Paragraph Architecture

Every body paragraph follows this four-part structure:

**T = Topic**: One declarative sentence stating the paragraph's claim.
**C = Cite**: 1-3 supporting sentences with citations providing evidence.
**E = Explain**: Analysis linking the evidence to the Research Question.
**L = Link**: Final sentence bridging to the next paragraph or section.

A paragraph missing any component is incomplete.

---

## Signposting Vocabulary

| Function      | Options                                            |
|---------------|----------------------------------------------------|
| Adding        | Furthermore, Moreover, In addition, Additionally   |
| Contrasting   | However, Nevertheless, In contrast, Conversely     |
| Causation     | Therefore, Consequently, As a result, Thus         |
| Exemplifying  | For instance, Specifically, In particular          |
| Concluding    | This demonstrates, This indicates, The findings suggest |
