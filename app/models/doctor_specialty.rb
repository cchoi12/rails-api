# == Schema Information
#
# Table name: doctor_specialties
#
#  id           :bigint(8)        not null, primary key
#  doctor_id    :integer
#  specialty_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class DoctorSpecialty < ApplicationRecord
  belongs_to :doctor
  belongs_to :specialty
end
