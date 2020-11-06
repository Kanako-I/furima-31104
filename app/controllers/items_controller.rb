class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
    redirect_to root_path unless user_signed_in? && @item.user_id == current_user.id
  end

  def update
    # @item = Item.find(params[:id])
    if @item.update(message_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def message_params
    params.require(:item).permit(:title, :description, :user, :price, :category_id, :item_condition_id, :shipping_fee_id, :shipped_prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
