# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  link_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  attr_accessible :votable

  belongs_to :user
  belongs_to :link
  belongs_to :votable, :polymorphic => true

  validates_uniqueness_of :user_id, :scope => [:votable_id, :votable_type]

  validates :user,         :presence => true
  validates :votable,      :presence => true
  validates :votable_type, :presence => true
end
