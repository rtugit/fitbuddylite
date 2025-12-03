class AiMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan
  before_action :set_chat

def create
  # 1) User message speichern
  user_message = @chat.ai_messages.create!(
    user:         current_user,
    workout_plan: @workout_plan,
    role:         "user",
    content:      params.require(:ai_message).fetch(:content)
  )

  # 2) Chat-Historie als Klartext erzeugen
  history_text = @chat.ai_messages.order(:created_at).map do |msg|
    speaker = msg.role == "user" ? "User" : "AI"
    "#{speaker}: #{msg.content}"
  end.join("\n")

  # 3) Prompt erzeugen
  prompt = <<~TEXT
    You are a workout assistant. Answer concisely.

    Conversation so far:
    #{history_text}

    User: #{user_message.content}
  TEXT

  # 4) AI-Antwort holen
  chat_llm    = RubyLLM.chat
ai_response = chat_llm.ask(prompt)

ai_text =
  if ai_response.respond_to?(:content)
    ai_response.content.to_s        # Antworttext aus RubyLLM holen
  else
    ai_response.to_s                # Fallback, falls sich das API-Objekt mal ändert
  end

  # 5) AI-Message speichern
  @chat.ai_messages.create!(
    user:         current_user,
    workout_plan: @workout_plan,
    role:         "assistant",
    content:      ai_text
  )

  # 6) Weiterleiten (bleibt genau hier!)
  redirect_to workout_plan_chat_path(@workout_plan, @chat)
end

  private

  def set_workout_plan
    @workout_plan = current_user.workout_plans.find(params[:workout_plan_id])
  end

  def set_chat
    @chat = @workout_plan.chats.find(params[:chat_id])
  end
end
