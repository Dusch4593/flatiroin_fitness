class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :name
      t.integer :times_per_week
      t.timestamps null: false
    end
  end
end
