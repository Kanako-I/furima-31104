require 'rails_helper'
RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form) 
  end

  context '購入画面挙動確認（正常確認）' do
    it 'すべての情報が正しいフォーマットで入力されていれば購入できる' do
      expect(@form).to be_valid
    end

    it '建物名が空でも購入できる' do
      @form.building = nil
      expect(@form).to be_valid
    end
  end

  context '購入画面挙動確認（非正常確認）' do
    it 'shipped_prefectureが空だと登録できない' do
      @form.shipped_prefecture_id = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Shipped prefecture can't be blank")
    end

    it 'shipped_prefectureがid:1だと登録できない' do
      @form.shipped_prefecture_id = 1
      @form.valid?
      expect(@form.errors.full_messages).to include('Shipped prefecture must be other than 1')
    end

    it '郵便番号が空だと登録できない' do
      @form.postal_code = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがないと登録できない' do
      @form.postal_code = '1111111'
      @form.valid?
      expect(@form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '市町村が空だと登録できない' do
      @form.town = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Town can't be blank")
    end

    it '番地が空だと登録できない' do
      @form.town_number = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Town number can't be blank")
    end

    it '電話番号が空だと登録できない' do
      @form.phone_number = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にハイフンが入ると登録できない' do
      @form.phone_number = '-'
      @form.valid?
      expect(@form.errors.full_messages).to include('Phone number is invalid.')
    end

    it '電話番号が12桁以上だと登録できない' do
      @form.phone_number = '111111111111'
      @form.valid?
      expect(@form.errors.full_messages).to include('Phone number is invalid.')
    end

    it 'tokenが空では登録できないこと' do
      @form.token = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Token can't be blank")
    end
  end
end
