class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tech_marks, :integer
    add_column :users, :non_tech_marks, :integer
    add_column :users, :interaction_marks, :integer
  end
end
