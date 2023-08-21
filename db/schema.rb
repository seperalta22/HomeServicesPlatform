# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_821_095_729) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.datetime 'start_time', null: false
    t.datetime 'end_time', null: false
    t.bigint 'user_id', null: false
    t.bigint 'service_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['service_id'], name: 'index_bookings_on_service_id'
    t.index ['user_id'], name: 'index_bookings_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.text 'comment'
    t.integer 'rating', null: false
    t.bigint 'user_id', null: false
    t.bigint 'service_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['service_id'], name: 'index_reviews_on_service_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'service_categories', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'service_categories_services', id: false, force: :cascade do |t|
    t.bigint 'service_category_id', null: false
    t.bigint 'service_id', null: false
    t.index ['service_category_id'], name: 'index_service_categories_services_on_service_category_id'
    t.index ['service_id'], name: 'index_service_categories_services_on_service_id'
  end

  create_table 'services', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'description'
    t.decimal 'price', precision: 10, scale: 2
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_services_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'password_digest', limit: 128, null: false
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'role'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'bookings', 'services'
  add_foreign_key 'bookings', 'users'
  add_foreign_key 'reviews', 'services'
  add_foreign_key 'reviews', 'users'
  add_foreign_key 'service_categories_services', 'service_categories'
  add_foreign_key 'service_categories_services', 'services'
  add_foreign_key 'services', 'users'
end
