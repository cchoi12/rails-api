# == Schema Information
#
# Table name: doctors
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  address    :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    address { 'Los Angeles, CA' }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
