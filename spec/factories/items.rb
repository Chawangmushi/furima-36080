FactoryBot.define do
  factory :item do
    name { '自作パソコン' }
    description { '自作パソコンです。CPUはIntelの第１０世代Corei5-10500で最大で4.5Ghzのクロック周波数です。メモリは16GB、グラボはGTX1650、M.2のSSD 1TBを搭載してます。' }
    price { '50000' }
    category_id { '8' }
    condition_id { '4' }
    shipping_payment_id { '2' }
    shipping_from_id { '14' }
    shipping_day_id { '3' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
