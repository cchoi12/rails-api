FactoryBot.define do
  factory :comment do
    comment_body { Faker::StarWars.quote }
    rating { Random.rand(1...5) }
    author_id { Random.rand(100..250) }
    doctor_id Doctor.last
  end
end
