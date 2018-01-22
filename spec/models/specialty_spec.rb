require 'rails_helper'

RSpec.describe Specialty, type: :model do
  let!(:specialty1) { create(:specialty) }

  it { should have_many(:doctors) }
  it { should have_many(:doctor_specialties).dependent(:destroy) }
  it { should validate_presence_of(:name) }

  it 'should be valid' do
    expect(specialty1).to be_valid
  end
end
