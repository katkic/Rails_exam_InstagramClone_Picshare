ActiveRecord::Schema.define(version: 2019_11_05_123828) do
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.text "image"
    t.text "caption"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

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

  add_foreign_key "posts", "users"
end
