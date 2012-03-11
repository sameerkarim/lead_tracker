class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :title
      t.text :description
      t.text :notes
      t.date :target_date
      t.references :contact

      t.timestamps
    end
    add_index :leads, :contact_id
  end
end
