class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    # The new action is now creating a new instance variable called @article, and you'll see why that is in just a few moments.
     @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end 
  end

  def create
    #@article = Article.new(params[:article])
    #@article = Article.new(params.require(:article).permit(:title, :text))
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      #render method is used so that the @article object is passed back to the new template when it is rendered.
      render 'new'           # se hace en el mismo request
      # redirect_to :action => 'new'                # nuevo request
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
    #Note that we don't need to add a view for this action since we're redirecting to the index action.
  end

  #reutilizable
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
