class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article bel et bien créé"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article bel et bien modifier"
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
end