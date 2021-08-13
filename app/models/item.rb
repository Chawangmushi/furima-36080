class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments

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
    validates :price,         inclusion: { in: 300..9_999_999, message: 'は300〜9,999,999の間で入力してください' },
                              numericality: { only_integer: true, message: '半角数字のみ入力可能です' }
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :shipping_payment_id
    validates :shipping_from_id
    validates :shipping_day_id
  end
end
