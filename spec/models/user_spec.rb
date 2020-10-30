require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録（非正常確認）' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "last_name_kanjiが空では登録できない" do
      @user.last_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end

    it "first_name_kanjiが空では登録できない" do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it "last_name_katakanaが空では登録できない" do
      @user.last_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
    end

    it "first_name_katakanaが空では登録できない" do
      @user.first_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end

    it "date_of_birthが空では登録できない" do
      @user.date_of_birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは半角英数字混合でないと登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "emailは＠を含まないと登録できないこと" do
      @user.email = "aaasample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  end


  describe 'ユーザー新規登録（正常確認）' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123aaa"
      @user.password_confirmation = "123aaa"
      expect(@user).to be_valid
    end

    it "password, nickname, email, password_confirmation, full_name, date_of_birthがあれば登録できること" do
      expect(@user).to be_valid
    end
  end
end
