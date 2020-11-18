class CreateSailboats < ActiveRecord::Migration
  def change
    create_table :sailboats do |t|
      t.string :name
      t.string :boat_type
      t.timestamps null: false
    end
  end
end
