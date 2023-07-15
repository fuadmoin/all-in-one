class ItemsController < ApplicationController
  before_action :set_category, only: [:index]

  def index
    @items = @category.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    if @item.save
      category_id = params[:item][:category_ids].first
      redirect_to category_items_path(category_id)
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def item_params
    params.require(:item).permit(
      :name, :amount, :unit_price, category_ids: []
    )
  end
end
