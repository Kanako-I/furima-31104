class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(message_params) 
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:item).permit(:title, :description, :user, :price, :category_id, :item_condition_id, :shipping_fee_id, :shipped_prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
