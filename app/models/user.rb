class User < ApplicationRecord

  attr_accessor :remember_token
  # makes remember_token accessible to an instance of User

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

  # adding a digest method for use in fixtures
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    # redefining computational 'cost' so that hash is easier to digest
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    # create a new token and store in remember_token attribute
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
    # remember_digest is a variable created by Active Record based on the name of the corresponding db column. points to self.remember_digest
  end

  def forget
    update_attribute(:remember_digest, nil)
    # will be called when users logout, wipes remember_digest column
  end

end
