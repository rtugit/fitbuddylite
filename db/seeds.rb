puts "Cleaning database..."
WorkoutPlan.destroy_all
User.destroy_all

puts "Creating user..."
user = User.create!(
  email: "testuser@example.com",
  password: "password123"
)

puts "Creating workout plans..."
WorkoutPlan.create!(
  level: "beginner",
  goal: "fat_loss",
  equipment: "none",
  duration_minutes: 10,
  ai_plan: "Sample",
  user: user
)

puts "Done!"
