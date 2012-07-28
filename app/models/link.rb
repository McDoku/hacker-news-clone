# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

GRAVITY = 1.8
TIME_TO_EDIT = 900

class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  attr_accessible :title, :url

  before_validation :sanitize

  validates :title, :presence => true
  validates :url, :presence => true, :uniqueness => true
  validates :user_id, :presence => true
  
  #fixme add validation for valid_edit?

  def valid_edit?
    true if (Time.now - created_at) < TIME_TO_EDIT
  end

  def score
     vote_count / ( hours_past + 2) ** GRAVITY
  end

  private
  
  def sanitize
    url = self.url.downcase
    self.url = "http://" + url if !url.match(/^http/)
  end

  def vote_count
    self.votes.count
  end

  def hours_past
    (Time.now - self.created_at)/3600
  end
end
