ActiveRecord::Schema.define(version: 2019_11_05_122304) do
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "image", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
