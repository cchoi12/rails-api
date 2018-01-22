FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    address { 'Los Angeles, CA' }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
