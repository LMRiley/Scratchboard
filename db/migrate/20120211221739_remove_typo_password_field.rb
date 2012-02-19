class RemoveTypoPasswordField < ActiveRecord::Migration
  def self.up
    remove_column :users, :encrcrypted_password
  end

  def self.down
  end
end
