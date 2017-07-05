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

ActiveRecord::Schema.define(version: 20170705191935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "edad"
    t.string   "email"
    t.string   "desc"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profesor_id"
    t.integer  "clase_id"
    t.integer  "plan_id"
    t.string   "rut"
  end

  create_table "alumnos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "sexo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pago_id"
    t.integer  "plan_id"
    t.string   "rut"
  end

  create_table "asistencia", force: :cascade do |t|
    t.datetime "fecha"
    t.integer  "cant_alumnos"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "asists", force: :cascade do |t|
    t.datetime "fecha"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "clase_id"
  end

  create_table "clases", force: :cascade do |t|
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profesor_id"
    t.integer  "asist_id"
    t.integer  "user_id"
  end

  create_table "pagos", force: :cascade do |t|
    t.integer  "monto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "alumno_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "desc"
  end

  create_table "profesors", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "edad"
    t.string   "email"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "clase_id"
    t.string   "rut"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "role",                   default: "profesor"
    t.string   "nombre"
    t.string   "rut"
    t.integer  "edad"
    t.string   "sexo"
    t.string   "observacion"
    t.integer  "clase_id"
    t.integer  "plan_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "contraseña"
    t.string   "estado"
    t.integer  "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "administradors", "clases"
  add_foreign_key "administradors", "plans"
  add_foreign_key "administradors", "profesors"
  add_foreign_key "alumnos", "pagos"
  add_foreign_key "alumnos", "plans"
  add_foreign_key "asists", "clases"
  add_foreign_key "clases", "asists"
  add_foreign_key "clases", "plans", column: "user_id"
  add_foreign_key "clases", "profesors"
  add_foreign_key "pagos", "alumnos"
  add_foreign_key "profesors", "clases"
  add_foreign_key "users", "clases"
  add_foreign_key "users", "plans"
end
