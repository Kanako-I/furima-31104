require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context 'カテゴリー挙動確認（非正常確認）' do
    it 'categoryが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'categoryがid:1だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'item_conditionが空だと登録できない' do
      @item.item_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it 'item_conditionがid:1だと登録できない' do
      @item.item_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Item condition must be other than 1')
    end

    it 'shipped_prefectureが空だと登録できない' do
      @item.shipped_prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipped prefecture can't be blank")
    end

    it 'shipped_prefectureがid:1だと登録できない' do
      @item.shipped_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipped prefecture must be other than 1')
    end

    it 'shipping_dateが空だと登録できない' do
      @item.shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end

    it 'shipping_dateがid:1だと登録できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
    end

    it 'shipping_feeが空だと登録できない' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end

    it 'shipping_feeがid:1だと登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
    end

    it 'titleが空だと登録できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it 'descriptionが空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満だと登録できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが10000000以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end

  context 'カテゴリー挙動確認（正常確認）' do
    it 'categoryがid:1以外なら登録できる' do
      @item.category_id = 2
      expect(@item).to be_valid
    end

    it 'shipped_prefectureがid:1以外なら登録できる' do
      @item.shipped_prefecture_id = 2
      expect(@item).to be_valid
    end

    it 'shipping_dateがid:1以外なら登録できる' do
      @item.shipping_date_id = 2
      expect(@item).to be_valid
    end

    it 'shipping_feeがid:1以外なら登録できる' do
      @item.shipping_fee_id = 2
      expect(@item).to be_valid
    end

    it 'item_conditionがid:1以外なら登録できる' do
      @item.item_condition_id = 2
      expect(@item).to be_valid
    end

    it 'priceが300以上だと登録できる' do
      @item.price = 300
      expect(@item).to be_valid
    end

    it 'priceが9999999以下だと登録できる' do
      @item.price = 9_999_999
      expect(@item).to be_valid
    end
  end
end
