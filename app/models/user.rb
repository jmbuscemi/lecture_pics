class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :uploaded_file

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  validates_attachment_content_type :uploaded_file, :content_type => /\Aimage\/.*\Z/

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
