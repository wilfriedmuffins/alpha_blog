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

ActiveRecord::Schema.define(version: 2020_12_12_165759) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

=begin
1 "rails g migration creat_articles"
2 ajoute attributs(columun of table) dans XXXXXX_create_article.rb
3 "rake db:migrate"

si ouble une colonum on peut generate une autre migration:
"rails g migrtion add_description_to_aricles" , un new file est 
create XXXXX_add_description_to_aricles ajoute dans attribut manquant dans ce fichier
faire une migration pour ajouter la MAJ : "rake db;migrtion"

comuniquer avec la table créér un new file dans le model :"article.rb"
les methodde CRUD deja prise en compte suite au fichier article.rb

=end