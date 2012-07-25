class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, :null => false
      t.integer :user_id, :null => false
      t.integer :link_id, :null => false

      t.timestamps
    end
  end
end
