class UsersController <ApplicationController
    before_action :set_user, only: [:edit, :show, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    def new
        @user = User.new
    end

    def index
        #@users = User.all
        @user = User.page(params[:page]).per(5)
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

    def destroy
        @user.destroy
        flash[:success] = "Utilisateur surprimer avec success et touts ces articles"
        redirect_to users_path
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "new user mise a mise à jours avec success !"
            redirect_to articles_path
        else
            render "edit"
        end
    end

    def show
        @user_articles = @user.articles.page(params[:page]).per(4)
    end

    private

    def set_user
        @user = User.find(params[:id]) #cherche l'user
    end

    def user_params
        #permet de vérifier que c'est une bien un titre et une descrioption que l'on envoie
        params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
        #user est dif de l'auteur
        if current_user != @user and current_user.admin? == false
            flash[:danger] = " hé tu fais quoi la non non tu ne peux pas faire sa c'est pas toi le user"
            redirect_to root_path
        end
    end

    def require_admin
        if logged_in? and current_user.admin? == false
            flash[:danger] = "attention tu fais quoi la tu n'es pas l'admin"
            redirect_to users_path
        end
    end
end