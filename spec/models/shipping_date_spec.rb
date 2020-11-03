require 'rails_helper'
RSpec.describe ShippingDate, type: :model do
  describe '発送日 挙動確認（非正常確認）' do
    before do
      @shippingdate = FactoryBot.build(:item)
    end
    
    it 'shipping_dateが空だと登録できない' do
      @shippingdate.category_id = ''
      @shippingdate.valid? 
      expect(@shippingdate.errors.full_messages).to include("Shipping date can't be blank")
    end
  
    it 'shipping_dateがid:1だと登録できない' do 
      @shippingdate.category_id = 1 
      @shippingdate.valid?
      expect(@shippingdate.errors.full_messages).to include("Shipping date must be other than 1")
    end
  end
  
    
  describe '発送日 挙動確認（正常確認）' do
    before do
      @shippingdate = FactoryBot.build(:item)
    end
  
    it 'shipping_dateがid:1以外なら登録できる' do 
      @shippingdate.category_id = 2 
      expect(@shippingdate.errors.full_messages).to be_valid
    end
  end
end
