class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :company
      t.string :phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
