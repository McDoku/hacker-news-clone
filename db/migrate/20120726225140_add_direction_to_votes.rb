class AddDirectionToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :direction, :integer
    # Vote.reset_column_information
    # Vote.all {|v| v.update_attribute(:direction, 1)}
    # change_column :votes, :direction, :integer, :null => false
  end
end
