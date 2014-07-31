class AddDescriptionToUser < ActiveRecord::Migration
  def change
    add_column :spree_users, :description, :text
  end
end
