require 'rails_helper'
RSpec.describe ShippedPrefecture, type: :model do
  describe '発送地 挙動確認（非正常確認）' do
    before do
      @shippedprefecture = FactoryBot.build(:item)
    end
    
    it 'shipped_prefectureが空だと登録できない' do
      @shippedprefecture.category_id = ''
      @shippedprefecture.valid? 
      expect(@shippedprefecture.errors.full_messages).to include("Shipped prefecture can't be blank")
    end
  
    it 'shipped_prefectureがid:1だと登録できない' do 
      @shippedprefecture.category_id = 1 
      @shippedprefecture.valid?
      expect(@shippedprefecture.errors.full_messages).to include("Shipped must be other than 1")
    end
  end
  
    
  describe '発送地 挙動確認（正常確認）' do
    before do
      @shippedprefecture = FactoryBot.build(:item)
    end
  
    it 'shipped_prefectureがid:1以外なら登録できる' do 
      @shippedprefecture.category_id = 2 
      @shippedprefecture.valid?
      expect(@shippedprefecture).to be_valid
    end
  end
end
