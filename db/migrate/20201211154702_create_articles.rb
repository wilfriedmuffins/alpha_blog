class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
    t.string :title 
    end
  end
end

=begin
dans la console rails
#methode pour créer un article
#m1
article = Article.new
article.title = "titre"
article.description = "description"
article.save

#m2
article=Article.new(title: "titre", description "description")
article.save

#m3()plus rapide)
Article.create(title: "titre", description: "description")

article.errors.any? : pertmet de savoir s'il il y a eu des errors
si true voir le type d'errors :
article.errors.full_messages : permet de savoir quelle sont les errors
=end