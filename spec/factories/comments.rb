# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  comment_body :text
#  rating       :integer
#  active       :boolean          default(FALSE)
#  author_id    :integer
#  doctor_id    :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :comment do
    comment_body { Faker::StarWars.quote }
    rating { Random.rand(1...5) }
    author_id { Random.rand(100..250) }
    doctor_id Doctor.last
  end
end
