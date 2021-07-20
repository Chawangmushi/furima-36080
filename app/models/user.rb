class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :surname,             presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]\z/ }
  validates :givenname,           presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]\z/ }
  validates :surname_furigana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :givenname_furigana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,            presence: true
  validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
end
