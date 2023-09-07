class ArticlesController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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

  private

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:notice] = "U can only edit and delete your articles!!"
      redirect_to articles_path
    end
  end
end
