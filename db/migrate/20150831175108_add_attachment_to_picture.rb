class AddAttachmentToPicture < ActiveRecord::Migration
  def change
    add_attachment :pictures, :uploaded_file
  end
end
