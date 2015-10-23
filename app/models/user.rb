class User < ActiveRecord::Base
  has_secure_password
  has_many :pictures

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: {message: "Email must be present"}, uniqueness: true
  validates :password, length: { minimum: 8, message: "8 character minimum" },
      allow_nil: true

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
