class AddTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_type, :string

  end
end
