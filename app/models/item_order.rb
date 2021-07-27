class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postalcode, :shipping_from_id, :city, :banchi, :building_name, :phone, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token, :city, :banchi
    validates :shipping_from_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone, numericality: {message: "is invalid. Please input half-width numbers" }, length: { in: 10..11 }
  end

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Shipping.create(postalcode: postalcode, shipping_from_id: shipping_from_id, city: city, banchi: banchi, building_name: building_name, phone: phone,  order_id: order.id)

    end
end