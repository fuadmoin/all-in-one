class ItemsController < ApplicationController
 
  def index
    @items = Item.all
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
     redirect_to items_path
    else
     render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :amount, :unit_price
    )
  end
end
