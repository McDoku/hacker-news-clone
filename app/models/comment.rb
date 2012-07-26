class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link, :polymorphic => true
  belongs_to :comment, :polymorphic => true
  has_many :comments, :as => :parent

  attr_accessible :content, :link_id

  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :parent_id, :presence => true
end