class WorkoutPlan < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :ai_messages, through: :chats

  validates :level, :goal, :duration_minutes, presence: true
end
