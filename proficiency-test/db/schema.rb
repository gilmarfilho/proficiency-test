# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160206063848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: true do |t|
    t.datetime "entry_at",   default: [], array: true
    t.integer  "course_id"
    t.integer  "student_id", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classrooms", ["course_id"], name: "index_classrooms_on_course_id", using: :btree
  add_index "classrooms", ["student_id"], name: "index_classrooms_on_student_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name",         limit: 25
    t.string   "description",  limit: 25
    t.integer  "status"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["classroom_id"], name: "index_courses_on_classroom_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "name",            limit: 25
    t.string   "register_number", limit: 25
    t.integer  "status"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["classroom_id"], name: "index_students_on_classroom_id", using: :btree

end
