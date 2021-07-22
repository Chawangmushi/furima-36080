class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payment
  belongs_to :shipping_from
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,         inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                              numericality: {only_integer: true,  message: 'is invalid. Please input half-width numbers only' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_payment_id
    validates :shipping_from_id
    validates :shipping_day_id
  end
end
