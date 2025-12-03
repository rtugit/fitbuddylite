class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :workout_plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
