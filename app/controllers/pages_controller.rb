class PagesController < ApplicationController
    def home
        #rediction vers les liste des article si connecter
        redirect_to articles_path if logged_in?
    end

    def about
    end
end