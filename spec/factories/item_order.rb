FactoryBot.define do
  factory :item_order do
    postalcode { '100-0000' }
    shipping_from_id { 2 }
    city { '中央区' }
    banchi { '日本橋' }
    building_name { 'トルナーレ浜町' }
    phone { '09012345678' }
    #association :order

  #  FactoryBot.define do
  #     factory :address_order do
  #       postal_code         {"123-4567"}
  #       prefecture_id       {2}
  #       municipality        {'名古屋市天白区'}
  #       address             {"3-3-3"}
  #       building            {"日本"}
  #       number              {"09063585116"}
  #       token               {"tok_abcdefghijk00000000000000000"}
  #     end
  #   end 


  end
end
