class ChangeNameOfParentColumns < ActiveRecord::Migration
  def change
    rename_column :comments, :parent_id, :commentable_id
    rename_column :comments, :parent_type, :commentable_type
  end
end
