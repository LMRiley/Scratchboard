class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :content
      t.integer :project_id
      t.integer :user_id
      t.string :status
      t.integer :points
      t.string :type

      t.timestamps
    end
    add_index :stories, [:project_id, :created_at, :user_id]
  end
end
