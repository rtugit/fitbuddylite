class CreateAiMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :ai_messages do |t|
      t.string :role
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :workout_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
