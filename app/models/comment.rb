# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :string(255)      not null
#  user_id          :integer          not null
#  commentable_id   :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_type :string(255)
#

#fixme make commentable_type not null

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  attr_accessible :content

  validates :commentable_id, :presence => true
  validates :content,        :presence => true
  validates :user_id,        :presence => true
end
