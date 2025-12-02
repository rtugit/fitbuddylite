# FitBuddyLite

FitBuddyLite is a small, Rails-based Mini AI workout app created as a Team Challenge for the Software & AI 2810 batch. It demonstrates how AI can assist in generating and refining workout plans and exercises while keeping the application simple and easy to extend.

**Team Members**

- **[Ahmed Nadir](https://github.com/TechnoVen)**
- **[Leonardo Van den Berghe](https://github.com/leonardovdb)**
- **[Richard Uehre](https://github.com/rtugit)**

**What this project is**

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
- Visit the app in browser at `http://127.0.0.1:3000`.

**Demo credentials**

- Email: `demo@example.com`
- Password: `password`

**Routes & UX notes**

- Workout plans are under `GET /workout_plans` (requires sign-in).
- Exercises are nested under a plan: e.g. `GET /workout_plans/:workout_plan_id/workout_exercises/new` and `GET /workout_plans/:workout_plan_id/workout_exercises/:id/edit`.

**Development & Contributing**

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
