class Article < ApplicationRecord
    belongs_to :user
    #article appartient tjs à un user
    
    #opération crud directement disponible grace à ce fichier
    #validates pour ne pas save des article avec vide(presence) + taille(length)
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :user_id, presence: true
end