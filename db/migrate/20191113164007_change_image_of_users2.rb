class ChangeImageOfUsers2 < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :image, :text, null: true, default: nil
  end

  def down
    change_column :users, :image, :text, null: false, default: 'default.png'
  end
end
