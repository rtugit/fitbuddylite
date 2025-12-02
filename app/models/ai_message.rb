class AiMessage < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :workout_plan
  # role for giving the aimessages table an aditional attribute (AI or human)
  validates :role, :content, presence: true
end
