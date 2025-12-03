class AiMessage < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :workout_plan
  belongs_to :chat, optional: true

  # role for giving the aimessages table an additional attribute (AI or human)
  validates :role, :content, presence: true
end
