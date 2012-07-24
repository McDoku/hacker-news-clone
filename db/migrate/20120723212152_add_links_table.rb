class AddLinksTable < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url,   :null => false
      t.string :title, :null => false

      t.timestamps
    end
  end
end