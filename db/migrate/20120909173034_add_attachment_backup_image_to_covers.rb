class AddAttachmentBackupImageToCovers < ActiveRecord::Migration
  def self.up
    change_table :covers do |t|
      t.has_attached_file :backup_image
    end
  end

  def self.down
    drop_attached_file :covers, :backup_image
  end
end
