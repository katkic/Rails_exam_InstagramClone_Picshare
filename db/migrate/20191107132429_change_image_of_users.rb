class ChangeImageOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :image, :text, null: false, default: 'default.png'
  end

  def down
    change_column :users, :image, :text, null: false
  end
end
