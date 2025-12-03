class Chat < ApplicationRecord
  belongs_to :workout_plan
  belongs_to :user

  has_many :ai_messages, dependent: :destroy
end
