FactoryBot.define do
  factory :shipping do
    postalcode { '100-0000' }
    shipping_from_id { 2 }
    city { '中央区' }
    banchi { '日本橋' }
    building_name { 'トルナーレ浜町' }
    phone { '09012345678' }
    association :order
  end
end
