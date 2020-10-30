class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_katakana, presence: true
  validates :first_name_katakana, presence: true
  validates :date_of_birth, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  FactoryBot.define do
    factory :user do
      nickname              {"abe"}
      email                 {"kkk@gmail.com"}
      password              {"123aaa"}
      password_confirmation {"123aaa"}
      last_name_kanji       {"池田"}
      first_name_kanji      {"可奈子"}
      last_name_katakana    {"イケダ"}
      first_name_katakana   {"カナコ"}
      date_of_birth         {19951211}
    end
  end
end 
