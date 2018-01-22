require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let!(:doctor1) { create(:doctor) }
  let!(:doctor2) { create(:doctor) }

  let!(:comment1){ create(:comment, doctor_id: doctor1.id, rating: 5) }
  let!(:comment2){ create(:comment, doctor_id: doctor1.id, rating: 3) }

  let!(:special1){ create(:specialty)}

  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:specialties) }
  it { should have_many(:doctor_specialties).dependent(:destroy) }

  it { should validate_presence_of(:name) }

  it 'has a valid factory' do
    expect(doctor1).to be_valid
  end

  it 'should return comments average' do
    expect(doctor1.comment_average).to eql(4)
  end

  it 'should return list of specialty-related doctors' do
    doctor1.doctor_specialties.create!(specialty_id: special1.id)
    doctor2.doctor_specialties.create!(specialty_id: special1.id)

    expect(doctor1.related_doctors).to include(doctor2)
  end

  it 'should not appear if no specialty-related match' do
    doctor1.doctor_specialties.create!(specialty_id: special1.id)

    expect(doctor1.doctor_specialties).to_not include(doctor2)
  end
end
