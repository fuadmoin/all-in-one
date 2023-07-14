class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create 
    @user = current_user
    @category = @user.categories.build(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name, :icon
    )
  end
end
