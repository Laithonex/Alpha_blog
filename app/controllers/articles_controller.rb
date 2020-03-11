class ArticlesController < ApplicationController
    def index
        @Anything = Article.all
    end 

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was seccusfuly created"
            redirect_to article_path(@article)
        else
            render 'new'
        end 
        # @article.save
        # redirect_to article_path(@article)
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was seccessfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def show
        @article = Article.find(params[:id])
    end 

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was seccessfully deleted"
        redirect_to article_path(@article)

    end

    private
    def article_params
        params.require(:article).permit(:title, :discription)
    end



end
