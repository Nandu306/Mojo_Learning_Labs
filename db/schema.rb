# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_20_123755) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.string "topic"
    t.datetime "deadline"
    t.bigint "user_id"
    t.bigint "taught_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "completed_assignments_count"
    t.string "note"
    t.index ["taught_class_id"], name: "index_assignments_on_taught_class_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "class_memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "taught_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["taught_class_id"], name: "index_class_memberships_on_taught_class_id"
    t.index ["user_id"], name: "index_class_memberships_on_user_id"
  end

  create_table "completed_assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "assignment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_completed_assignments_on_assignment_id"
    t.index ["user_id"], name: "index_completed_assignments_on_user_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.string "subject"
    t.string "topic"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "assignment_id", null: false
    t.index ["assignment_id"], name: "index_questions_on_assignment_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_answers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "question_id"
    t.bigint "assignment_id"
    t.bigint "option_id"
    t.bigint "completed_assignment_id"
    t.index ["assignment_id"], name: "index_student_answers_on_assignment_id"
    t.index ["completed_assignment_id"], name: "index_student_answers_on_completed_assignment_id"
    t.index ["option_id"], name: "index_student_answers_on_option_id"
    t.index ["question_id"], name: "index_student_answers_on_question_id"
  end

  create_table "taught_classes", force: :cascade do |t|
    t.string "year"
    t.string "subject"
    t.string "academic_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "class_memberships_count"
    t.integer "assignments_count"
    t.index ["user_id"], name: "index_taught_classes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.string "name", null: false
    t.bigint "school_id"
    t.string "year"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignments", "taught_classes"
  add_foreign_key "assignments", "users"
  add_foreign_key "class_memberships", "taught_classes"
  add_foreign_key "class_memberships", "users"
  add_foreign_key "completed_assignments", "assignments"
  add_foreign_key "completed_assignments", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "assignments"
  add_foreign_key "student_answers", "assignments"
  add_foreign_key "student_answers", "completed_assignments"
  add_foreign_key "student_answers", "options"
  add_foreign_key "student_answers", "questions"
  add_foreign_key "taught_classes", "users"
  add_foreign_key "users", "schools"
end
