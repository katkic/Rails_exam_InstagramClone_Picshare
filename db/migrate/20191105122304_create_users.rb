class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.text :image, null: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
