class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to 

    end
  end

  def update
    set_category
    if @category.update(category_params)
      redirect_to category_path(@category.id)
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
