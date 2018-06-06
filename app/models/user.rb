class User < ApplicationRecord
  before_save :email_downcase
  validates :name, presence: true,
    length: {maximum: Settings.validate.user.name.maxlength}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.validate.user.email.maxlength},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.validate.user.password.maxlength}

  private

  def email_downcase
    email.downcase!
  end
end
