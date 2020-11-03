require 'rails_helper'
RSpec.describe Category, type: :model do
  describe 'カテゴリー挙動確認（非正常確認）' do
    before do
      @category = FactoryBot.build(:item)
    end

    it "categoryが空だと登録できない" do
      @category.category_id = ''
      @category.valid? 
      expect(@category.errors.full_messages).to include("Category can't be blank")
    end

    it 'categoryがid:1だと登録できない' do
      @category.category_id = 1 
      @category.valid?
      expect(@category.errors.full_messages).to include("Category must be other than 1")
    end
  end


  describe 'カテゴリー挙動確認（正常確認）' do
    before do
      @category = FactoryBot.build(:item)
    end

    it 'categoryがid:1以外なら登録できる' do
      @category.category_id = 2 
      expect(@category).to be_valid
    end
  end
end
 