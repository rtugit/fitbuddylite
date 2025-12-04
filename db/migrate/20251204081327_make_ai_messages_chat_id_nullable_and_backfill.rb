class MakeAiMessagesChatIdNullableAndBackfill < ActiveRecord::Migration[7.1]
  def up
    # First, make chat_id nullable
    change_column_null :ai_messages, :chat_id, true

    # Create default chats for workout plans that have ai_messages without a chat
    WorkoutPlan.find_each do |workout_plan|
      orphaned_messages = workout_plan.ai_messages.where(chat_id: nil)
      
      if orphaned_messages.any?
        # Create a default chat for this workout plan
        default_chat = Chat.create!(
          workout_plan: workout_plan,
          user: workout_plan.user,
          title: "Legacy Chat - #{workout_plan.goal}"
        )
        
        # Associate all orphaned messages with the new chat
        orphaned_messages.update_all(chat_id: default_chat.id)
      end
    end
  end

  def down
    # Remove nullable constraint (make it required again)
    change_column_null :ai_messages, :chat_id, false
  end
end
