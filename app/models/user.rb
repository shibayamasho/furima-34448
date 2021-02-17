class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX # message: 'には英字と数字の両方を含めて設定してください'

    validates :nickname

    NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
    with_options format: { with: NAME_REGEX } do
      validates :last_name
      validates :first_name
    end

    NAME_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
    with_options format: { with: NAME_KATAKANA_REGEX } do
      validates :last_name_katakana
      validates :first_name_katakana
    end

    validates :birthday
  end

  # has_many :items
  # has_many :purchases
end
