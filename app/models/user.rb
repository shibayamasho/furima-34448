class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX  # message: 'には英字と数字の両方を含めて設定してください' 
  
  validates :nickname, presence: true

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, presence: true, format: {with: NAME_REGEX}
  validates :first_name, presence: true, format: {with: NAME_REGEX}

  NAME_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_katakana, presence: true, format: {with: NAME_KATAKANA_REGEX}
  validates :first_name_katakana, presence: true, format: {with: NAME_KATAKANA_REGEX}
  
  validates :birthday, presence: true

  # has_many :items
  # has_many :purchases
end
