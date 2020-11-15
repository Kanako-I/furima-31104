class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:create, :index]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(address_params)
    if @form.valid?
      pay_item
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  # 全てのストロングパラメーターを1つに統合
  def address_params
    params.require(:form).permit(:postal_code, :shipped_prefecture_id, :town, :town_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && @item.user_id != current_user.id
  end
end
