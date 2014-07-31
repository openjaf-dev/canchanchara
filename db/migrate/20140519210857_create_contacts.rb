class CreateContacts < ActiveRecord::Migration
  def change
    create_table :spree_contacts do |t|
      t.string :from
      t.string :to
      t.text :message

      t.timestamps
    end
  end
end
