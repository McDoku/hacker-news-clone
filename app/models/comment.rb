class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  attr_accessible :content, :user_id, :link_id

  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :link_id, :presence => true
end