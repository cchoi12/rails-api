# == Schema Information
#
# Table name: specialties
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :specialty do
    name { 'Anesthesiology' }
  end
end
