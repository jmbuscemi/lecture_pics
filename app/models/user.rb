class User < ActiveRecord::Base
  has_secure_password
  has_many :pictures

  validates :first_name, presence: {message: "First name must be present"}
  validates :last_name, presence: {message: "Last name must be present"}
  validates :email, presence: {message: "Email must be present"}, uniqueness: true
  validates :password, length: { minimum: 8, message: "Password must be at least 8 characters" },
      allow_nil: true

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
