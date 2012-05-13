class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :thought_id
      t.string :user

      t.timestamps
    end
    add_index :comments, [:thought_id, :created_at]
  end
end
