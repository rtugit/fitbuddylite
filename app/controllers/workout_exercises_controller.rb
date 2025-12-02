class WorkoutExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan
  before_action :set_workout_exercise, only: [:edit, :update, :destroy]

  def new
    @workout_exercise = @workout_plan.workout_exercises.new
  end

  def create
    @workout_exercise = @workout_plan.workout_exercises.new(workout_exercise_params)
    if @workout_exercise.save
      redirect_to workout_plan_path(@workout_plan), notice: "Exercise added."
    else
      flash.now[:alert] = "Could not add exercise."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # If the user requests AI assistance, perform a simple placeholder modification.
    if params[:ai_assist] == "1"
      # Placeholder for AI integration: append a suggestion note to description
      params[:workout_exercise][:description] = [params[:workout_exercise][:description], "\n\nAI suggestion: consider adjusting reps for progressive overload."].compact.join("\n")
    end

    if @workout_exercise.update(workout_exercise_params)
      redirect_to workout_plan_path(@workout_plan), notice: "Exercise updated."
    else
      flash.now[:alert] = "Could not update exercise."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout_exercise.destroy
    redirect_to workout_plan_path(@workout_plan), notice: "Exercise deleted."
  end

  private

  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
  end

  def set_workout_exercise
    @workout_exercise = @workout_plan.workout_exercises.find(params[:id])
  end

  def workout_exercise_params
    params.require(:workout_exercise).permit(:step_order, :name, :description, :reps_or_duration, :rest_seconds)
  end
end
