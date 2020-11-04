require 'rails_helper'
RSpec.describe Item, type: :model do
  describe 'カテゴリー挙動確認（非正常確認）' do
    before do
      @category = FactoryBot.build(:item) 
      @itemcondition = FactoryBot.build(:item)
      @shippedprefecture = FactoryBot.build(:item)
      @shippingdate = FactoryBot.build(:item)
      @shippingfee = FactoryBot.build(:item)
      @title = FactoryBot.build(:item)
      @description = FactoryBot.build(:item)
      @price = FactoryBot.build(:item)
    end
  
    it 'categoryが空だと登録できない' do
      @category.category_id = ''
      @category.valid? 
      expect(@category.errors.full_messages).to include("Category can't be blank")
    end

    it 'categoryがid:1だと登録できない' do
      @category.category_id = 1 
      @category.valid?
      expect(@category.errors.full_messages).to include("Category must be other than 1")
    end

    it 'item_conditionが空だと登録できない' do
      @itemcondition.item_condition_id = ''
      @itemcondition.valid? 
      expect(@itemcondition.errors.full_messages).to include("Item condition can't be blank")
    end
  
    it 'item_conditionがid:1だと登録できない' do 
      @itemcondition.item_condition_id = 1 
      @itemcondition.valid?
      expect(@itemcondition.errors.full_messages).to include("Item condition must be other than 1")
    end

    it 'shipped_prefectureが空だと登録できない' do
      @shippedprefecture.shipped_prefecture_id = ''
      @shippedprefecture.valid? 
      expect(@shippedprefecture.errors.full_messages).to include("Shipped prefecture can't be blank")
    end
  
    it 'shipped_prefectureがid:1だと登録できない' do 
      @shippedprefecture.shipped_prefecture_id = 1 
      @shippedprefecture.valid?
      expect(@shippedprefecture.errors.full_messages).to include("Shipped prefecture must be other than 1")
    end

    it 'shipping_dateが空だと登録できない' do
      @shippingdate.shipping_date_id = ''
      @shippingdate.valid? 
      expect(@shippingdate.errors.full_messages).to include("Shipping date can't be blank")
    end
  
    it 'shipping_dateがid:1だと登録できない' do 
      @shippingdate.shipping_date_id = 1 
      @shippingdate.valid?
      expect(@shippingdate.errors.full_messages).to include("Shipping date must be other than 1")
    end

    it 'shipping_feeが空だと登録できない' do
      @shippingfee.shipping_fee_id = ''
      @shippingfee.valid? 
      expect(@shippingfee.errors.full_messages).to include("Shipping fee can't be blank")
    end
  
    it 'shipping_feeがid:1だと登録できない' do 
      @shippingfee.shipping_fee_id = 1 
      @shippingfee.valid?
      expect(@shippingfee.errors.full_messages).to include("Shipping fee must be other than 1")
    end

    it 'titleが空だと登録できない' do
      @title.title = ''
      @title.valid? 
      expect(@title.errors.full_messages).to include("Title can't be blank")
    end
  
    it 'descriptionが空だと登録できない' do
      @description.description = ''
      @description.valid? 
      expect(@description.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空だと登録できない' do
      @price.price = ''
      @price.valid? 
      expect(@price.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満だと登録できない' do
      @price.price = 200
      @price.valid? 
      expect(@price.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが300未満だと登録できない' do
      @price.price = 10000000
      @price.valid? 
      expect(@price.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end


  describe 'カテゴリー挙動確認（正常確認）' do
    before do
      @category = FactoryBot.build(:item)
      @itemcondition = FactoryBot.build(:item)
      @shippedprefecture = FactoryBot.build(:item)
      @shippingdate = FactoryBot.build(:item)
      @shippingfee = FactoryBot.build(:item)
      @price = FactoryBot.build(:item)
    end

    it 'categoryがid:1以外なら登録できる' do 
      @category.category_id = 2 
      expect(@category).to be_valid
    end

    it 'shipped_prefectureがid:1以外なら登録できる' do 
      @shippedprefecture.shipped_prefecture_id = 2 
      expect(@shippedprefecture).to be_valid
    end

    it 'shipping_dateがid:1以外なら登録できる' do 
      @shippingdate.shipping_date_id = 2 
      expect(@shippingdate).to be_valid
    end

    it 'shipping_feeがid:1以外なら登録できる' do
      @shippingfee.shipping_fee_id = 2 
      expect(@shippingfee).to be_valid
    end

    it 'item_conditionがid:1以外なら登録できる' do 
      @itemcondition.item_condition_id = 2
      expect(@itemcondition).to be_valid
    end

    it 'priceが300以上だと登録できる' do
      @price.price = 300
      expect(@price).to be_valid
    end

    it 'priceが9999999以下だと登録できる' do
      @price.price = 9999999
      expect(@price).to be_valid
    end
  end
end
