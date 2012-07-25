class User < ActiveRecord::Base
  has_many :links
  has_many :comments
  has_many :votes

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :handle, :password, :password_confirmation
  has_secure_password

  validates :email, :presence => true, :uniqueness => true, :format => {:with => VALID_EMAIL_REGEX}
  validates :handle, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => {minimum: 6}
  validates :password_confirmation, :presence => :true

  private

  def sanitize
    self.email = email.downcase
  end
end
