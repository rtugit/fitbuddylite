# FitBuddyLite — Project Review & Status

Date: 2025-12-03

This document summarises the current project state, our recent work, merged pull requests, major features, pending items, and recommended next steps.

## Project at-a-glance

- Project: FitBuddyLite — a Mini AI workout app (Rails 7, Ruby 3.x)
- Team: Ahmed Nadir (TechnoVen), Leonardo Van den Berghe, Richard Uehre (rtugit)

## Recent merged work (high level)

- PR #44 — Add workout plan form (Scope 2: new + create) — MERGED
- PR #43 — UI: Center Devise auth forms — MERGED
- PR #42 — Add LICENSE.md (MIT) — MERGED
- PR #41 — Scope1: fixes — MERGED
- PR #40 — Scope3: Edit & Update Exercises — MERGED
- PR #39 — Scope1: Index + Show — MERGED
- PR #38 — Add seed data for WorkoutPlans — MERGED

Other scaffold and onboarding PRs (Sprint 1) are also merged (PR #25 and PRs #26–#37).

## Key features currently in `master`

- Authentication with `devise` (Sign in / Sign up / Forgot password) — centred UI overrides
- Models: `User`, `WorkoutPlan`, `WorkoutExercise`, `AiMessage`
- Workout plans CRUD flows (index, show, new/create merged)
- Nested `workout_exercises` with new/edit/update/destroy flows
- Simple AI-assist placeholder on exercise update (checkbox that appends a suggestion)
- Demo seed data — `demo@example.com / password` with sample plans and exercises
- `README.md` and contribution onboarding (`DEVELOPMENT.md`) present
- `LICENSE.md` (MIT)

## What we added (high-level mapping)

- Ahmed Nadir / TechnoVen: project orchestration, Scope1 (index/show), Scope3 edits, centred auth UI, README updates.
- Richard Uehre / rtugit: seeds, models, controller scaffolding, Scope2 (new/create) form.
- Leonardo: contributed to UI, review and pairing during sprints.

## Pending work / WIP

1. Integrate a real AI service for `ai_messages` and exercise suggestions (currently placeholder text).
2. Add system/integration tests for critical flows (auth, plan CRUD, exercise edit/update).
3. CI: GitHub Actions to run tests on PRs and merge gates.
4. Improve error display and validation UX on forms (show field errors and flash messages).
5. Mobile/responsive polish and accessibility checks.

## Quick start (for reviewers)

1. Clone the repo and install gems:
   ```bash
   bundle install
   ```
2. Prepare the database and seed demo data:
   ```bash
   bin/rails db:create db:migrate db:seed
   ```
3. Start the server and sign in as the demo user:
   ```bash
   bin/rails server
   # Visit http://127.0.0.1:3000
   # Sign in: demo@example.com / password
   ```

## Recommended next steps (prioritised)

1. Wire a real AI provider (OpenAI or similar) into `ai_messages#create` and exercise suggestions. Define environment variables for API keys and document them in `.env.example`.
2. Add system tests covering:
   - Sign in / sign up flows
   - Create / view / edit a workout plan
   - Add and edit an exercise (including AI-assist checkbox behaviour)
3. Add a basic GitHub Actions workflow to run tests on PRs.
4. Address visual polish and add responsive checks across devices.

## Notes and pointers (files to review)

- `app/models/` — domain models (WorkoutPlan, WorkoutExercise, AiMessage)
- `app/controllers/` — `workout_plans_controller.rb`, `workout_exercises_controller.rb`, `ai_messages_controller.rb`
- `app/views/` — `workout_plans/`, `workout_exercises/`, `devise/` overrides
- `db/seeds.rb` — demo data used during testing
- `config/routes.rb` — nested routes for `workout_exercises` and `ai_messages`

---

Prepared by the FitBuddyLite Team — shared for the Software & AI 2810 Team Challenge
