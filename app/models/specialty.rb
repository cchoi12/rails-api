class Specialty < ApplicationRecord
  has_many :doctor_specialties, dependent: :destroy
  has_many :doctors, through: :doctor_specialties

  validates :name, presence: true
end
