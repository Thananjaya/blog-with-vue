class CategoriesController < ApplicationController
  def new
    @category=Category.new
  end

  def index
    @categories=Category.all
  end

  def show
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    if @category.update(permit_category)
      redirect_to category_path(@category)
    else
      redirect_to 'edit' 
    end   
  end

  def destroy
    @category=Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def edit
      @category=Category.find(params[:id])
  end

  def create
    @category=Category.new(permit_category)
    if @category.save
      redirect_to category_path(@category)
    else
      redirect_to 'new'
    end  
  end


  private

    def permit_category
      params.require(:category).permit(:title)
    end
end
