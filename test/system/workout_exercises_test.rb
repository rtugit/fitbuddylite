require "application_system_test_case"

class WorkoutExercisesTest < ApplicationSystemTestCase
  test "user can sign in and edit an exercise" do
    # Create test data
    user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
    plan = WorkoutPlan.create!(
      user: user,
      level: "intermediate",
      goal: "Build strength",
      equipment: "dumbbells",
      duration_minutes: 30
    )
    exercise = WorkoutExercise.create!(
      workout_plan: plan,
      step_order: 1,
      name: "Push-ups",
      description: "Standard push-ups",
      reps_or_duration: "12 reps",
      rest_seconds: 60
    )

    # Visit sign-in page
    visit new_user_session_path
    assert_selector "h3", text: "Sign in"

    # Sign in
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    # Navigate to workout plans
    visit workout_plans_path
    assert_selector "h1", text: "My Workout Plans"

    # View the plan
    click_link "Build strength"
    assert_selector "h1", text: "Build strength"

    # Edit the exercise
    within(".list-group-item", text: "Push-ups") do
      click_link "Edit"
    end

    # Update exercise details
    fill_in "Name", with: "Modified Push-ups"
    fill_in "Description", with: "Push-ups with modified form"
    fill_in "Reps / Duration", with: "15 reps"
    
    # Test AI assist checkbox
    check "Ask AI to suggest improvements"
    
    click_button "Update Workout exercise"

    # Verify update
    assert_text "Exercise updated"
    assert_text "Modified Push-ups"
    assert_text "AI suggestion: consider adjusting reps for progressive overload"
  end
end
