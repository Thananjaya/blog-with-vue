class ArticlesController < ApplicationController
  def new
    @article=Article.new
  end

  def index
    @articles=Article.all
  end

  def show
    @article=Article.find(params[:id])
  end

  def update
    if @article.update(permit_article)
      redirect_to article_path(@article)
    else
      redirect_to 'edit' 
    end   
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to 'index'
  end

  def edit
      @article=Article.find(params[:id])
  end

  def create
    @article=Article.new(permit_article)
    if @article.save
      redirect_to article_path(@article)
    else
      redirect_to 'new'
    end  
  end


  private

    def permit_article
      params.require(:article).permit(:title, :content, subcategory_ids: [])
    end  
end
