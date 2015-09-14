class Picture < ActiveRecord::Base
  belongs_to :user
  has_attached_file :uploaded_file, styles: {
    square: '175x175#',
    medium: '200x200#'
  }

  validates_attachment_content_type :uploaded_file, :content_type => /\Aimage\/.*\Z/

end
