class CreatePartTasksTable < ActiveRecord::Migration
  def change
    create_table :part_tasks do |t|
      t.integer :task_id
      t.integer :part_id

    end
  end
end
