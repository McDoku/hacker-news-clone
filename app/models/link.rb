# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  attr_accessible :title, :url

  before_validation :sanitize

  validates :title, :presence => true
  validates :url, :presence => true, :uniqueness => true
  validates :user_id, :presence => true

  def valid_edit?
    true if (Time.now - created_at) < 900
  end

  private
  def sanitize
    url = self.url.downcase
    self.url = "http://" + url if !url.match(/^http/)
  end
end
