class AddDescriptionToArticles < ActiveRecord::Migration[6.0]
  def change
    #add_column :nomtable, :nomcolonne, :typeattribut
    add_column :articles, :description, :text 
    #ajouter date de creation + date de MAJ
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
