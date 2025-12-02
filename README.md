# FitBuddyLite

FitBuddyLite is a small, Rails-based Mini AI workout app created as a Team Challenge for the Software & AI 2810 batch. It demonstrates how AI can assist in generating and refining workout plans and exercises while keeping the application simple and easy to extend.

**Team Members**

- **Ahmed Nadir**
- **Leonardo Van den Berghe**
- **Richard Uehre**

**What this project is (my understanding)**

- **Rails Application**: A Rails 7 application (Ruby 3.x) with standard MVC structure.
- **Authentication**: Uses `devise` for user sign-up and sign-in.
- **Core Models**: `User`, `WorkoutPlan`, `WorkoutExercise`, and `AiMessage` for chat/AI interactions.
- **Key Features Implemented**:
  - List and view workout plans (`index`, `show`).
  - Create and manage exercises for a plan (nested `workout_exercises` routes).
  - Edit/update exercises with an "AI assist" checkbox (placeholder logic that appends a suggestion).
  - Basic AI message routing scaffolding (`ai_messages` nested routes) for a future AI coach chat.
  - Seed data providing a demo user and sample plans/exercises for local testing.
- **Goals**: Provide a lightweight interface where users can get AI-assisted workout suggestions and manage plans and exercises.

**Quick Start (local)**

- Install dependencies:
  - `bundle install`
- Prepare the database and load demo data:
  - `bin/rails db:create db:migrate db:seed`
- Start the server:
  - `bin/rails server`
- Visit the app in your browser at `http://127.0.0.1:3000`.

**Demo credentials**

- Email: `demo@example.com`
- Password: `password`

**Routes & UX notes**

- Workout plans are under `GET /workout_plans` (requires sign-in).
- Exercises are nested under a plan: e.g. `GET /workout_plans/:workout_plan_id/workout_exercises/new` and `GET /workout_plans/:workout_plan_id/workout_exercises/:id/edit`.

**Development & Contributing**

- Branch naming: use `feature/<issue-number>-short-description` (e.g. `feature/22-scope3-edit-update`).
- Open a PR against `master` (or the repository's main branch) and use the provided PR template.
- Suggested next work items:
  - Integrate a real AI service for `ai_messages` and refine exercise suggestions.
  - Add system tests for index/show and exercise edit/update flows.
  - Add CI workflow and code style checks.

**Where I looked / files of interest**

- `app/models/` — domain models
- `app/controllers/` — `workout_plans_controller.rb`, `workout_exercises_controller.rb`, `ai_messages_controller.rb`
- `app/views/workout_plans/` and `app/views/workout_exercises/` — UI templates
- `db/seeds.rb` — demo data
- `config/routes.rb` — nested routes

If you'd like, I can:

- Add a minimal system test that signs in `demo@example.com` and covers editing an exercise.
- Replace the AI placeholder with a real call to an AI service (outline the API and keys required).

Enjoy building — let me know which next step you want me to take.
Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
