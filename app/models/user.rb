class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  has_secure_password

  def admin?
    role == "admin"
  end
    
end
