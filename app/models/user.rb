class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :surname
      validates :givenname
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :surname_furigana
      validates :givenname_furigana
    end

    validates :birthday
  end
    validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
end
