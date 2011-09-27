class AddUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :userrol, :string
  end

  def self.down
    remove_column :users, :userrol
  end
end
