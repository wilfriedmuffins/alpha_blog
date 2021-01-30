class User < ActiveRecord::Base
    #validation pour le taille mini et max + elment unique pour le username
    
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: {minimum: 3, maximum: 25}

    VALID_EMAIL_REGEX = /.+\@.+\..+/i

    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        format: { with: VALID_EMAIL_REGEX }
end