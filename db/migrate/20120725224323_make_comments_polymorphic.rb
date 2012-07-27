class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    rename_column :comments, :link_id, :parent_id
    add_column :comments, :parent_type, :string

    Comment.reset_column_information
    Comment.all.each do |c|
      c.update_attribute(:parent_type, "link")
    end
  end
end
