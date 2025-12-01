class WorkoutPlan < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises, dependent: :destroy
  has_many :ai_messages, dependent: :destroy

  validates :level, :goal, :duration_minutes, presence: true
end
