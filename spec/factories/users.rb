FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '123aaa' }
    password_confirmation { '123aaa' }
    last_name_kanji       { '池田' }
    first_name_kanji      { '可奈子' }
    last_name_katakana    { 'イケダ' }
    first_name_katakana   { 'カナコ' }
    date_of_birth         { 19_951_211 }
  end
end
