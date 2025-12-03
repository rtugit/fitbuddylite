class AiMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan
  before_action :set_chat

  def create
    # 1) User message speichern
    user_message = @chat.ai_messages.create!(
      user: current_user,
      workout_plan: @workout_plan,
      role: "user",
      content: params.require(:ai_message).fetch(:content)
    )

    # 2) Chat-Historie als Klartext erzeugen
    history_text = @chat.ai_messages.order(:created_at).map do |msg|
      speaker = msg.role == "user" ? "User" : "AI"
      "#{speaker}: #{msg.content}"
    end.join("\n")

    # 3) Prompt erzeugen
    prompt = <<~TEXT
      You are a helpful fitness coach. Answer clearly and practically.

      Conversation:
      #{history_text}

      AI:
    TEXT

    # 4) AI-Antwort von RubyLLM
    chat_llm = RubyLLM.chat
    ai_response = chat_llm.ask(prompt)
    ai_text =
      if ai_response.respond_to?(:text)
        ai_response.text.to_s   # RubyLLM::Message → echten Text holen
      else
        ai_response.to_s        # Fallback, falls irgendwann ein String zurückkommt
      end

    # 5) AI Message speichern
    @chat.ai_messages.create!(
      user: current_user,
      workout_plan: @workout_plan,
      role: "assistant",
      content: ai_text
    )

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
