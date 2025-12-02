puts "Cleaning database..."
WorkoutPlan.destroy_all
User.destroy_all

puts "Creating demo user..."
demo_user = User.create!(
  email: "demo@example.com",
  password: "password"
)

puts "Creating workout plans..."

# Plan 1: Beginner Fat Loss
plan1 = WorkoutPlan.create!(
  level: "beginner",
  goal: "Fat Loss",
  equipment: "Dumbbells",
  duration_minutes: 30,
  ai_plan: "Warm up for 5 minutes, then perform 3 sets of each exercise with 60 seconds rest between sets.",
  user: demo_user
)

# Add exercises to Plan 1
WorkoutExercise.create!(
  workout_plan: plan1,
  step_order: 1,
  name: "Dumbbell Squats",
  description: "Stand with feet shoulder-width apart, holding dumbbells at shoulders. Lower into a squat.",
  reps_or_duration: "12 reps",
  rest_seconds: 60
)

WorkoutExercise.create!(
  workout_plan: plan1,
  step_order: 2,
  name: "Dumbbell Push-ups",
  description: "Place hands on dumbbells in plank position, lower chest to dumbbells.",
  reps_or_duration: "10 reps",
  rest_seconds: 60
)

WorkoutExercise.create!(
  workout_plan: plan1,
  step_order: 3,
  name: "Dumbbell Rows",
  description: "Hinge at hips, pull dumbbells to chest, focusing on shoulder blade movement.",
  reps_or_duration: "12 reps",
  rest_seconds: 60
)

# Plan 2: Intermediate Strength
plan2 = WorkoutPlan.create!(
  level: "intermediate",
  goal: "Strength Building",
  equipment: "Barbell, Rack",
  duration_minutes: 45,
  ai_plan: "Focus on compound lifts with heavy weight. 4 sets of 5 reps per exercise. Rest 2-3 minutes between sets.",
  user: demo_user
)

WorkoutExercise.create!(
  workout_plan: plan2,
  step_order: 1,
  name: "Barbell Squats",
  description: "Full body compound lift targeting legs, back, and core.",
  reps_or_duration: "5 reps",
  rest_seconds: 180
)

WorkoutExercise.create!(
  workout_plan: plan2,
  step_order: 2,
  name: "Barbell Bench Press",
  description: "Chest dominant compound pressing movement.",
  reps_or_duration: "5 reps",
  rest_seconds: 180
)

WorkoutExercise.create!(
  workout_plan: plan2,
  step_order: 3,
  name: "Barbell Deadlifts",
  description: "Ultimate full body lift, focus on proper form.",
  reps_or_duration: "3 reps",
  rest_seconds: 240
)

# Plan 3: Advanced HIIT
plan3 = WorkoutPlan.create!(
  level: "advanced",
  goal: "Conditioning & Cardio",
  equipment: "None",
  duration_minutes: 20,
  ai_plan: "High intensity interval training. 40 seconds work, 20 seconds rest. Repeat circuit 4 times.",
  user: demo_user
)

WorkoutExercise.create!(
  workout_plan: plan3,
  step_order: 1,
  name: "Burpees",
  description: "Full body explosive movement combining squat, push-up, and jump.",
  reps_or_duration: "40 seconds",
  rest_seconds: 20
)

WorkoutExercise.create!(
  workout_plan: plan3,
  step_order: 2,
  name: "Jump Squats",
  description: "Explosive leg movement, landing softly.",
  reps_or_duration: "40 seconds",
  rest_seconds: 20
)

WorkoutExercise.create!(
  workout_plan: plan3,
  step_order: 3,
  name: "Mountain Climbers",
  description: "Core and cardio exercise, fast-paced leg drive.",
  reps_or_duration: "40 seconds",
  rest_seconds: 20
)

puts "Created user: #{demo_user.email}"
puts "Created #{demo_user.workout_plans.count} workout plans with #{WorkoutExercise.count} exercises"
puts "Done!"
