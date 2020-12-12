class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
    t.string :title #creation d'unecoloum title de type string"
    end
  end
end

=begin

#create la table: rails g create_NameTable
#ajoute des colum dans le fichier235445_creae_nameTables
#(si colunm oubli faire rails g )

#methode pour créer un article
#m1
article = Article.new
article.title = "titre"
article.description = "description"
article.save

#m2
article Article.new(title: "titre", description "description")
article.save

#m3()plus rapide)
Article.create(title: "titre", description: "description")

=end