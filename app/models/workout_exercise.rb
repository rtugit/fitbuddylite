class WorkoutExercise < ApplicationRecord
  belongs_to :workout_plan
  validates :step_order, presence: true
end
