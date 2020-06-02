class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true

  validates :email, uniqueness: {case_sensitive: false}

  validates :password, length: { minimum: 1 }, on: :create

  def self.authenticate_with_credentials(email, password)
    
    user = User.find_by(email: email.strip)
    user && user.authenticate(password) ? user : nil
  end
end
