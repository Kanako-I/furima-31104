require 'rails_helper'
RSpec.describe ShippingFee, type: :model do
  describe '配送料 挙動確認（非正常確認）' do
    before do
      @shippingfee = FactoryBot.build(:item)
    end
    
    it 'shipping_feeが空だと登録できない' do
      @shippingfee.category_id = ''
      @shippingfee.valid? 
      expect(@shippingfee.errors.full_messages).to include("Shipping fee can't be blank")
    end
  
    it 'shipping_feeがid:1だと登録できない' do 
      @shippingfee.category_id = 1 
      @shippingfee.valid?
      expect(@shippingfee.errors.full_messages).to include("Shipping fee must be other than 1")
    end
  end
  
    
  describe '配送料 挙動確認（正常確認）' do
    before do
      @shippingfee = FactoryBot.build(:item)
    end
  
    it 'shipping_feeがid:1以外なら登録できる' do 
      @shippingfee.category_id = 2 
      @shippingfee.valid?
      expect(@shippingfee.errors.full_messages).to be_valid
    end
  end
end
