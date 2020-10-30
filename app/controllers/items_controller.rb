class ItemsController < ApplicationController
  def index
  end

  private

  def message_params
    params.require(:items).permit(:title, :image, :description, :user, :price, :category_id, :item_condition_id, :shipping_fee_id, :shipped_prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
