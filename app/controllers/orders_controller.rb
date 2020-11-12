class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]  
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @form = Form.new
  end

  def create
    @form = Form.new(address_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  # 全てのストロングパラメーターを1つに統合 
  def address_params
    params.require(:form).permit(:postal_code, :shipped_prefecture_id, :town, :town_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
