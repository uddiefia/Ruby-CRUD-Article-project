class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destory]

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article]
        @article = Article.new(artilce_params)
        if @article.save
            flash[:notice] = "Article was created successfully!"
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @article.update(artilce_params)
            flash[:notice] = "Article was updated successfully!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def artilce_params
    params.require(:article).permit(:title, :description)
    end

end
