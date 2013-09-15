class AddUseridToThoughts < ActiveRecord::Migration
  def change
    add_column :thoughts, :user_id, :integer
  end
end
