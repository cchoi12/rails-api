require 'rails_helper'

RSpec.describe 'Doctor API v1', type: :request do
  let!(:doctors) { create_list(:doctor, 10) }
  let(:doctor_id) { doctors.first.id }

  describe 'GET /v1/doctors' do
    before { get '/v1/doctors' }

    it 'returns doctors' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /v1/doctors/:id' do
    before { get "/v1/doctors/#{doctor_id}" }

    context 'when the record exists' do
      it 'returns the doctor' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(doctor_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:doctor_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Doctor/)
      end
    end
  end
end
