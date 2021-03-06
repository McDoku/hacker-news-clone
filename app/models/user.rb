# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  handle          :string(255)      not null
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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

  def karma
    comment_karma + link_karma
  end

  private
  
  def comment_karma
    User.joins(:comments => :votes).where('id' => self.id).sum('votes.direction').to_i
  end

  def link_karma
    User.joins(:links => :votes).where('id' => self.id).sum('votes.direction').to_i
  end

  def sanitize
    self.email = email.downcase
  end
end
