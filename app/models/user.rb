class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #validates :nickname,          presence: true
  #validates :surname,           presence: true
  #validates :givenname,         presence: true
  #validates :surname_furigana,  presence: true
 #validates :given_furigana,    presence: true
  #validates :birthday,          presence: true

  #has_many :items

end
