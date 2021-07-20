FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password {'1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    surname { '洗' }
    givenname { '理史' }
    surname_furigana { 'アライ' }
    givenname_furigana { 'サトシ' }
    birthday { '2000-01-01' }
  end
end
