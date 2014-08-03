class AddEmailToContact < ActiveRecord::Migration
  def change
    add_column :spree_contacts, :email, :string
  end
end
