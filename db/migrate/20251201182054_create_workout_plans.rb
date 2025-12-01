class CreateWorkoutPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_plans do |t|
      t.string :level
      t.string :goal
      t.text :equipment
      t.integer :duration_minutes
      t.text :ai_plan
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
