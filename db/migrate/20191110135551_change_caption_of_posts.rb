class ChangeCaptionOfPosts < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :caption, :text, null: false
  end

  def down
    change_column :posts, :caption, :text
  end
end
