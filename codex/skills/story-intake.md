# Story Intake

Goal: elicit a complete user story and acceptance criteria from the developer.

## Ask (one at a time, adapt to answers)
1. Who is the user (role/persona)?
2. What do they want to do (capability)?
3. Why (business value/benefit)?
4. What must be true for this to be "done"? (acceptance criteria)
   - Prompt for scenarios: "What happens in the happy path? On error? What are the edge cases?"
5. Any business rules, validations, or constraints?
6. Non-functional requirements: performance, security, logging, compliance?
7. What is explicitly out of scope?
8. Any known dependencies (services, teams, APIs)?

## Output
Draft the following and hand to `spec-author`:
- User story (`As a... I want... so that...`)
- A numbered list of ACs (one scenario each, plain language)
- Business rules
- Non-functional requirements
- Out of scope
- Dependencies

## Tips
- Push for concrete, testable ACs. If an AC can't be tested, it's not an AC.
- For each AC, confirm the happy path AND at least one edge/error case.
- Use concrete values ("balance 100"), not vague words ("some money").
