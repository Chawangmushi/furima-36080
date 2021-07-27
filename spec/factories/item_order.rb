FactoryBot.define do
  factory :item_order do
    postalcode { '100-0000' }
    shipping_from_id { 2 }
    city { '中央区' }
    banchi { '日本橋' }
    building_name { 'トルナーレ浜町' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
