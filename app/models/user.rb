class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { email.downcase! }
  # some databases consider duplicate email addresses to be unique even if they are the same, but in a different case. Before saving we will convert all emails to lowercase so that our 'unique' attribute functions as intended.

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  has_secure_password
  # requires 'bcrypt' gem - looks for a password_digest column in our users table
  validates :password,  presence: true, length: { minimum: 6 }

  # adding a digest method for use in fixures
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    # redifining computational 'cost' so that hash is easier to digest
    BCrypt::Password.create(string, cost: cost)
  end

end
