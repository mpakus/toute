class AddNetworkUidProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :network, :string
    add_column :users, :uid, :string
    add_column :users, :profile, :string
    remove_column :users, :last_name
  end
end
