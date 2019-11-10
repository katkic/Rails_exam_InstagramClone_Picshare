class ChangeImageOfPosts < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :image, :text, null: false
  end

  def down
    change_column :posts, :image, :text
  end
end
