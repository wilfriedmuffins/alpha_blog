class SessionsController < ApplicationController
    def new
        
    end

    def create
        #récuperer l'email + mot de pass du user avevc params[:session]
        user = User.find_by(email: params[:session][:email].downcase)
        #user authenticate() pour vérifer si le mot de pass est bon
        if user && user.authenticate(params[:session][:password])
            flash[:success] = " Félicitation de cette incroyable connexion!"

            #stock la session dans les cookies du navigateur du user
            session[:user_id] = user.id

            redirect_to user_path(user)
        else
            flash.now[:danger] = "email ou mot de password pas bon :("
            #reaffiché sur la même page
            render "new"
        end
    
    end

    def destroy #decoonection=destroy la session
        session[:user_id] = nil
        flash[:success] = "bye bye waye !"
        redirect_to root_path
    end
    
end