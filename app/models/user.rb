class User < ActiveRecord::Base
  has_secure_password
  has_many :pictures

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
