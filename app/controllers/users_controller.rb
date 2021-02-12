class UsersController <ApplicationController
    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create 
        #defini @user avec les valeur du form grace à params
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "new user #{@user.username} created !"
            redirect_to articles_path
        else
            render "new"
        end
    end

    def edit
        @user = User.find(params[:id]) #cherche l'user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "new user mise a mise à jours avec success !"
            redirect_to articles_path
        else
            render "edit"
        end
    end

    def show
        @user = User.find(params[:id])
        
    end

    private

    def user_params
        #permet de vérifier que c'est une bien un titre et une descrioption que l'on envoie
        params.require(:user).permit(:username, :email, :password)
    end
end