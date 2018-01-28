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

ActiveRecord::Schema.define(version: 20180126080839) do

  create_table "estudiantes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "ncuenta"
    t.string "correo_electronico"
    t.float "exact_sigma", limit: 24
    t.float "exact_mean", limit: 24
    t.float "real_sigma", limit: 24
    t.float "real_mean", limit: 24
    t.decimal "seed", precision: 10
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
