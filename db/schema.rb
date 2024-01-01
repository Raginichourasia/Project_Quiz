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

ActiveRecord::Schema[7.0].define(version: 2023_12_18_163454) do
  create_table "assessments", force: :cascade do |t|
    t.string "level"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "assessments_questions", force: :cascade do |t|
    t.integer "assessment_id", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_assessments_questions_on_assessment_id"
    t.index ["question_id"], name: "index_assessments_questions_on_question_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employee_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.boolean "is_correct"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "performances", force: :cascade do |t|
    t.float "score"
    t.integer "user_id", null: false
    t.integer "assessment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_performances_on_assessment_id"
    t.index ["user_id"], name: "index_performances_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.integer "imagable_id"
    t.string "imagable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "pictures" because of following StandardError
#   Unknown type 'name' for column 'type'

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.string "manufacturer"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions_assessments", id: false, force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "assessment_id", null: false
    t.index ["assessment_id"], name: "index_questions_assessments_on_assessment_id"
    t.index ["question_id"], name: "index_questions_assessments_on_question_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question_id", null: false
    t.integer "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_responses_on_option_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role", default: 0
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assessments", "users"
  add_foreign_key "assessments_questions", "assessments"
  add_foreign_key "assessments_questions", "questions"
  add_foreign_key "options", "questions"
  add_foreign_key "performances", "assessments"
  add_foreign_key "performances", "users"
  add_foreign_key "responses", "options"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "users"
end
