class ApplicationController < ActionController::Base

    #rendre disponible les methodes dans les view
    helper_method :current_user, :logged_in?


    # recuper le user qui co actuelle
    def current_user
       @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    #repond oui ou non si on est connecte
    def logged_in?
        !!current_user
    end

    #methode si pas connecter
    def require_user
        if not logged_in?
            flash[:danger] = " o o tu n'es pas connecté"
            redirect_to root_path
        end
    end
end
