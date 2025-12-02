class WorkoutPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[show edit update destroy]

  def index
    @workout_plans = current_user.workout_plans
  end

  def show
  end

  def new
    @workout_plan = WorkoutPlan.new
  end

  def create
    @workout_plan = WorkoutPlan.new(workout_plan_params)
    @workout_plan.user = current_user
    if @workout_plan.save
      redirect_to @workout_plan
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def workout_plan_params
    params.require(:workout_plan).permit(:level, :goal, :equipment, :duration_minutes)
  end

  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:id])
  end

  def authorize_user!
    redirect_to workout_plans_path, alert: "Not authorized" unless @workout_plan.user == current_user
  end
end
