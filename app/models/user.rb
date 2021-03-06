class User < ApplicationRecord
    #user peut avoir plusieur article +dependant avec les ar
    has_many :articles, dependent: :destroy
    has_secure_password
    
    #save email en minuscule
    before_save {self.email.downcase!}

    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: {minimum: 3, maximum: 25}

    VALID_EMAIL_REGEX = /.+\@.+\..+/i

    validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX}     
end