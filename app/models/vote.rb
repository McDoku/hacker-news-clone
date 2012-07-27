# class DirectionValidator < ActiveModel::Validator
#   def validate(record, attribute, value)
#     unless value == 1 || value == -1
#       record.errors[attribute] << (options[:message]) || "is not plus or minus 1"
#     end
#   end
# end

class Vote < ActiveRecord::Base
  attr_accessible :votable, :direction

  belongs_to :user
  belongs_to :link
  belongs_to :votable, :polymorphic => true

  validates_uniqueness_of :user_id, :scope => [:votable_id, :votable_type]
  # validates_numericality_of :direction, :if => Proc.new {|v| v.direction.abs == 1}

  validates :user,         :presence => true
  validates :direction,    :presence => true
  validates :votable,      :presence => true
  validates :votable_type, :presence => true
end