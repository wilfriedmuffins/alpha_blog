class ArticlesController < ApplicationController
    #permet d'apel le méthode set-article das les actions edit show delete update
    before_action :set_article, only: [:edit, :show, :delete, :update, :destroy]


    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
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
        flash[:danger] = "Article suprimé"
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
end