# DEVELOPMENT.md

## Purpose
Quick developer onboarding for FitBuddyLite.

## Prerequisites
- Ruby version: see `Gemfile` / `.ruby-version`
- PostgreSQL installed and running
- Node & Yarn (if needed by frontend)
- Recommended: direnv / dotenv for environment variables

## Environment variables
Create a `.env` file (or use Rails credentials). Example variables:
DATABASE_URL=postgres://localhost/fitbuddylite_development
AI_API_KEY=your_api_key_here
RAILS_ENV=development

## Setup (first time)
# install gems
bundle install

# setup DB
bin/rails db:create db:migrate db:seed

# run the app
bin/dev    # or bin/rails server

## Running tests
# run unit/system tests
bin/rails test
# or if using RSpec
bundle exec rspec

## Seeds
To (re)create demo data:
bin/rails db:seed

## Jobs / Background processing
ActiveJob runs inline in development by default. To run async workers, configure adapter (Sidekiq) and set REDIS_URL accordingly.

## AI integration
- Set `AI_API_KEY` in `.env` or credentials.
- The repo will include an `AiService` scaffold. Use `AI_MOCK_MODE=true` in dev to avoid real API calls.

## Branching & PR workflow
- Create a feature branch `feature/S2-1-short-desc`
- Open a PR to `master` with linked backlog ID
- Require at least one reviewer and CI green before merge

## Local debugging tips
- Logs: tail -f log/development.log
- Console: bin/rails console
- Recreate DB: bin/rails db:drop db:create db:migrate db:seed

## Contacts
- Frontend Lead: @frontend
- Backend Lead: @backend
- AI/Integration: @ai-integration

