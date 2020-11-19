class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :date_completed
      t.datetime :date_due
      t.integer :sailboat_id
      t.text :procedure
      t.timestamps null: false
    end
  end
end
