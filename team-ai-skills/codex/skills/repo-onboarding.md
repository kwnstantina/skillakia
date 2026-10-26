# Repository Onboarding

Goal: understand the codebase before making changes.

## Steps
1. Read the repository README, CONTRIBUTING, and any docs/ADR folders.
2. Identify the commands:
   - Build (e.g. `dotnet build`, `npm run build`)
   - Test (e.g. `dotnet test`, `npm test`)
   - Run (e.g. `dotnet run`, `npm run dev`)
3. Map the structure:
   - Backend (.NET): solution/projects, controllers/services/repositories, DI setup, config (appsettings.json + Azure Key Vault references).
   - Frontend (React): component structure, routing, state management, API client layer.
4. Find the conventions:
   - Naming, folder layout, error handling, logging, test patterns.
5. Read `AGENTS.md` / `CLAUDE.md` in the repo — repo rules override this file.

## Output
Before coding, summarize: how to build/test/run, key folders, and any conventions you noticed.

## Team-specific (fill in)
- Build command: ___________
- Test command: ___________
- Run command: ___________
- Main backend projects: ___________
- Main frontend app: ___________
