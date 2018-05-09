# == Schema Information
#
# Table name: specialties
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Specialty < ApplicationRecord
  has_many :doctor_specialties, dependent: :destroy
  has_many :doctors, through: :doctor_specialties

  validates :name, presence: true
end
