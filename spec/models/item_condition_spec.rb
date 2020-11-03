require 'rails_helper'
RSpec.describe ItemCondition, type: :model do
  describe '商品の状態 挙動確認（非正常確認）' do
    before do
      @itemcomdition = FactoryBot.build(:item)
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
  end
  
    
  describe '商品の状態 挙動確認（正常確認）' do
    before do
      @itemcondition = FactoryBot.build(:item)
    end

    it 'categoryがid:1以外なら登録できる' do 
      @itemcondition.item_condition_id = 2 
      expect(@itemcondition).to be_valid
    end
  end
end
   