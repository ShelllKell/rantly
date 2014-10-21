

ActiveRecord::Schema.define(version: 20141021192505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: true do |t|
    t.integer  "rant_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer "follower_id"
    t.integer "followee_id"
  end

  create_table "rants", force: true do |t|
    t.string   "topic"
    t.string   "rant"
    t.integer  "user_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio"
    t.string   "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
