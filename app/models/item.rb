class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payment
  belongs_to :shipping_from
  belongs_to :shipping_day


  validates :image,                         presence: true
  validates :name,                          presence: true
  validates :description,                   presence: true
  validates :price,                         presence: true, inclusion: { in: 300..9_999_999 , message: "is out of setting range" }, format: { with: /\A[0-9]+\z/}

  #with_options presence: true do
  validates :category_id,                   numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,                  numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_payment_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_from_id,              numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,               numericality: { other_than: 1 , message: "can't be blank"}
  #end
  
end
