class AddBriefToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :brief, :string
  end
end
