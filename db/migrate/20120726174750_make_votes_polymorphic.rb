class MakeVotesPolymorphic < ActiveRecord::Migration
  def change
    rename_column :votes, :link_id, :votable_id
    add_column :votes, :votable_type, :string, :null => false

    Vote.reset_column_information

    Vote.all.each do |v|
      v.update_attribute(:votable_type, "link")
    end
  end
end
