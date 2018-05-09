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

require 'rails_helper'

RSpec.describe DoctorSpecialty, type: :model do
  let!(:doctor1)  { create(:doctor) }
  let!(:special)  { create(:specialty) }

  it { should belong_to(:doctor) }
  it { should belong_to(:specialty) }

  it 'should be valid with a doctor and specialty' do
    doctor_specialty = DoctorSpecialty.create!(doctor_id: doctor1.id, specialty_id: special.id)

    expect(doctor_specialty).to be_valid
  end
end
