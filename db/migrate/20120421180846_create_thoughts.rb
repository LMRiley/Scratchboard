class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :content
      t.integer :project_id

      t.timestamps
    end
    add_index :thoughts, [:project_id, :created_at]
  end
end
