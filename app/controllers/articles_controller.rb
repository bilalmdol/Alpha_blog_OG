class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @newArticle = Article.new #important for initializations
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @newArticle = Article.new(params.require(:articles).permit(:title, :desc))
    @user = current_user
    @user.save
    @newArticle.user = @user
    if @newArticle.save
      flash[:notice] = "Article Successfully Saved!"
      redirect_to @newArticle
    else render "new"     end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :desc))
      flash[:notice] = "Article was Edited Successfully!"
      redirect_to @article
    else render "edit"     end
  end

  def destroy
    @articleToDestroy = Article.find(params[:id])
    @articleToDestroy.destroy

    redirect_to articles_path
  end
end
