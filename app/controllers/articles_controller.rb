class ArticlesController < ApplicationController
    #permet d'apel le méthode set-article das les actions edit show delete update +befor action s'exercute dans l'ordre
    before_action :set_article, only: [:edit, :show, :delete, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :delete, :destroy]


    def index
        #récupérer toute les articles
        #@articles = Article.all
        #récupérer all article with pagination
        @articles = Article.page(params[:page]).per(5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:success] = "Article bel et bien créé"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @article.destroy
        flash[:success] = "Article suprimé y bon"
        redirect_to articles_path
    end

    def update
            if @article.update(article_params)
            flash[:success] = "Article bel et bien modifier"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    private

    def article_params
        #permet de vérifier que c'est une bien un titre et une descrioption que l'on envoie
        params.require(:article).permit(:title, :description)
    end

    def set_article
        @article = Article.find(params[:id])
    end
    
    def require_same_user
        #user est dif de l'auteur
        if current_user != @article.user and current_user.admin? == false
            flash[:danger] = " hé tu fais quoi la non non tu ne peux pas faire sa c'est pas ton article"
            redirect_to root_path
        end
    end
end