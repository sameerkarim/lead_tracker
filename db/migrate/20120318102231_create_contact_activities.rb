class CreateContactActivities < ActiveRecord::Migration
  def change
    create_table :contact_activities do |t|
      t.date :activity_date
      t.text :description
      t.references :contact

      t.timestamps
    end
    add_index :contact_activities, :contact_id
  end
end
