class AddAttachmentScratchfileToThoughts < ActiveRecord::Migration
  def self.up
    add_column :thoughts, :scratchfile_file_name, :string
    add_column :thoughts, :scratchfile_content_type, :string
    add_column :thoughts, :scratchfile_file_size, :integer
    add_column :thoughts, :scratchfile_updated_at, :datetime
  end

  def self.down
    remove_column :thoughts, :scratchfile_file_name
    remove_column :thoughts, :scratchfile_content_type
    remove_column :thoughts, :scratchfile_file_size
    remove_column :thoughts, :scratchfile_updated_at
  end
end
