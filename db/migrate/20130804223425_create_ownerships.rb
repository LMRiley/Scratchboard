class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    
    add_index :ownerships, :project_id
    add_index :ownerships, :user_id
    add_index :ownerships, [:project_id, :user_id], unique: true
  end
end
