class AddUsernameToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :username, :string
    add_index :spree_users, :username, unique: true
  end
end
