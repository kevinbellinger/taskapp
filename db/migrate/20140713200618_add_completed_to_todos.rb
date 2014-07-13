class AddCompletedToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :completed, :integer
  end
end
