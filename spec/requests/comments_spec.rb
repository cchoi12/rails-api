require 'rails_helper'

RSpec.describe 'Comment API v1' do
  let!(:doctor) { create(:doctor) }
  let!(:comments) { create_list(:comment, 20, doctor_id: doctor.id) }
  let(:doctor_id) { doctor.id }
  let(:id) { comments.first.id }

  describe 'GET /v1/doctors/:doctor_id/comments' do
    before { get "/v1/doctors/#{doctor_id}/comments" }

    context 'when doctor exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all doctor comments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when doctor does not exist' do
      let(:doctor_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Doctor/)
      end
    end
  end

  describe 'GET /v1/doctors/:doctor_id/comments/:id' do
    before { get "/v1/doctors/#{doctor_id}/comments/#{id}" }

    context 'when doctor comment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the comment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when doctor comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'POST /v1/doctors/:doctor_id/comments' do
    let(:valid_attributes) { { comment_body: 'This guy was meh', author_id: 12345, rating: 2} }

    context 'when request attributes are valid' do
      before { post "/v1/doctors/#{doctor_id}/comments", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/v1/doctors/#{doctor_id}/comments", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Comment body can't be blank, Author can't be blank, Rating is not included in the list/)
      end
    end
  end

  describe 'PUT /v1/doctors/:doctor_id/comments/:id' do
    let(:valid_attributes) { { rating: 1 } }

    before { put "/v1/doctors/#{doctor_id}/comments/#{id}", params: valid_attributes }

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.rating).to match(1)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'DELETE /v1/doctors/:id' do
    before { delete "/v1/doctors/#{doctor_id}/comments/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
