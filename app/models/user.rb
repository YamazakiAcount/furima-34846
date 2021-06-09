class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many:records

  with_options presence: true do
    validates :nickname
    validates :birth_day
    # ひらがな、カタカナ、漢字のみ許可する
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      # カタカナのみ許可する
      validates :family_name_kana
      validates :first_name_kana
    end
    # 半角英字数字のみ許可する
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters.' }
  end
end
