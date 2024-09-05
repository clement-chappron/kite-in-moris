# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_05_213910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blog_pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blog_pages_on_user_id"
  end

  create_table "comment_blogs", force: :cascade do |t|
    t.text "description"
    t.bigint "blog_page_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["blog_page_id"], name: "index_comment_blogs_on_blog_page_id"
    t.index ["user_id"], name: "index_comment_blogs_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_schools", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "school_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_review_schools_on_school_id"
    t.index ["user_id"], name: "index_review_schools_on_user_id"
  end

  create_table "review_shops", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "shop_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_review_shops_on_shop_id"
    t.index ["user_id"], name: "index_review_shops_on_user_id"
  end

  create_table "review_spots", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_review_spots_on_spot_id"
    t.index ["user_id"], name: "index_review_spots_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.string "email"
    t.text "description"
    t.text "rental"
    t.text "levels"
    t.string "fee"
    t.string "facebook"
    t.string "instagram"
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "category"
    t.index ["location_id"], name: "index_schools_on_location_id"
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.text "description"
    t.string "email"
    t.string "facebook"
    t.string "instagram"
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "category"
    t.index ["location_id"], name: "index_shops_on_location_id"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.string "slug"
    t.index ["location_id"], name: "index_spots_on_location_id"
    t.index ["slug"], name: "index_spots_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.boolean "is_manager", default: false
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blog_pages", "users"
  add_foreign_key "comment_blogs", "blog_pages"
  add_foreign_key "comment_blogs", "users"
  add_foreign_key "review_schools", "schools"
  add_foreign_key "review_schools", "users"
  add_foreign_key "review_shops", "shops"
  add_foreign_key "review_shops", "users"
  add_foreign_key "review_spots", "spots"
  add_foreign_key "review_spots", "users"
  add_foreign_key "schools", "locations"
  add_foreign_key "schools", "users"
  add_foreign_key "shops", "locations"
  add_foreign_key "shops", "users"
  add_foreign_key "spots", "locations"
end
