class RemoveAttachmentFromUser < ActiveRecord::Migration
  def change
    remove_attachment :users, :uploaded_file
  end
end
