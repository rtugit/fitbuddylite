class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan

  def show
    @chat = @workout_plan.chats.find(params[:id])
    @ai_messages = @chat.ai_messages.order(created_at: :asc)
    @ai_message = AiMessage.new
  end

  def create
    @chat = @workout_plan.chats.create!(
      user: current_user,
      title: params[:title].presence || "Chat for #{@workout_plan.goal}"
    )
    redirect_to workout_plan_chat_path(@workout_plan, @chat)
  end

  private

  def set_workout_plan
    @workout_plan = current_user.workout_plans.find(params[:workout_plan_id])
  end
end
