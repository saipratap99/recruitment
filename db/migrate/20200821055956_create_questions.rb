class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.string :ans, default: "0"

      t.timestamps
    end
  end
end
