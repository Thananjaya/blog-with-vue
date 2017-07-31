class SubcategoriesController < ApplicationController
  def new
    @subcategory=Subcategory.new
  end

  def index
    @subcategories=Subcategory.all
  end

  def show
    @subcategory=Subcategory.find(params[:id])
  end

  def update
    if @subcategory.update(permit_subcategory)
      redirect_to subcategory_path(@subcategory)
    else
      redirect_to 'edit' 
    end   
  end

  def destroy
    @subcategory=Subcategory.find(params[:id])
    @subcategory.destroy
    redirect_to 'index'
  end

  def edit
      @subcategory=Subcategory.find(params[:id])
  end

  def create
    @subcategory=Subcategory.new(permit_subcategory)
    if @subcategory.save
      redirect_to subcategory_path(@subcategory)
    else
      redirect_to 'new'
    end  
  end


  private

    def permit_subcategory
      params.require(:subcategory).permit(:title, :category_id)
    end
end
