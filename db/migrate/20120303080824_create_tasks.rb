class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.text :priority
      t.date :target_date
      t.date :actual_date
      t.references :contact

      t.timestamps
    end
    add_index :tasks, :contact_id
  end
end
