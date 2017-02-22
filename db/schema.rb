# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170222224038) do

  create_table "royal_students", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "royal_students_teachers", id: false, force: :cascade do |t|
    t.integer "royal_student_id", null: false
    t.integer "teacher_id",       null: false
    t.index ["royal_student_id", "teacher_id"], name: "index_royal_students_teachers_on_student_id_and_teacher_id", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_teachers", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
    t.index ["student_id", "teacher_id"], name: "index_students_teachers_on_student_id_and_teacher_id", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
