class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  attr_accessible :content, :link_id

  validates :commentable_id, :presence => true
  validates :content,        :presence => true
  validates :user_id,        :presence => true
end
