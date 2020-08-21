class CreateUserQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :scored, default: 0

      t.timestamps
    end
  end
end
