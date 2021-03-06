class ArticlesController < ApplicationController


  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])


  end


  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Product was successfully saved"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = "Product was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  def show
    @article = Article.find(params[:id])
  end

  def index

    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Thank you for Ordering Product will be arrived soon"
    redirect_to articles_path
  end




  private
    def article_params
      params.require(:article).permit(:title, :description, :price, :cover)
    end
end
