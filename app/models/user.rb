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
  validates :last_name, format: { with: NAME_REGEX }
  validates :first_name, format: { with: NAME_REGEX }

  NAME_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_katakana, format: { with: NAME_KATAKANA_REGEX }
  validates :first_name_katakana, format: { with: NAME_KATAKANA_REGEX }

  validates :birthday

  # has_many :items
  # has_many :purchases
  end
end
