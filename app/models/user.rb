class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[一-龥]+\z/} do
    validates :last_name_kanji, presence: true
    validates :first_name_kanji, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_katakana, presence: true
    validates :first_name_katakana, presence: true
  end
  validates :date_of_birth, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
