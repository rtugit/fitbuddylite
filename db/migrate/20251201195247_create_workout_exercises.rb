class CreateWorkoutExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_exercises do |t|
      t.integer :step_order
      t.string :name
      t.text :description
      t.string :reps_or_duration
      t.integer :rest_seconds
      t.references :workout_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
