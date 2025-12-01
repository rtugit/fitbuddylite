class AiMessagesController < ApplicationController
  before_action :set_workout_plan

  def index
    @messages = @workout_plan.ai_messages
  end

  def create
    @message = @workout_plan.ai_messages.new(
      content: params[:content],
      role: "user"
    )
    @message.save
  end

  private

  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
  end
end
