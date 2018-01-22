# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
professions = ["Anesthesiologist", "Cardiologist", "Gynecologist"]
professions.each do |profession|
  Specialty.create([{
    name: profession
    }])
end

50.times do |number|
  Doctor.create([{
    name: Faker::Name.name,
    address: nil,
    latitude: nil,
    longitude: nil
  }])

  DoctorSpecialty.create([{
    doctor_id: number,
    specialty_id: Random.rand(1..3)
  }])

  Comment.create!([{
    comment_body: Faker::StarWars.quote,
    rating: Random.rand(1..5),
    author_id: Random.rand(100..250),
    doctor_id: Doctor.last.id
  }])
end

Doctor.where("(id % 2) > 0").all.update(
  address: 'Los Angeles, CA'
)

Doctor.where("(id % 2) = 0").all.update(
  address: 'New York City, NY'
)
