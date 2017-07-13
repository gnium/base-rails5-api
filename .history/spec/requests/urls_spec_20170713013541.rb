# spec/requests/urls_spec.rb

require 'rails_helper'

RSpec.describe 'URL API', type: :request do
  # initialize test data 
  let!(:urls) { create_list(:url, 10) }
  let(:url_id) { urls.first.id }

  # Test suite for GET /urls
  describe 'GET /urls' do
    # make HTTP get request before each example
    before { get '/urls' }

    it 'returns urls' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /urls/:id
  describe 'GET /urls/:id' do
    before { get "/urls/#{url_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(url_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:url_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Url/)
      end
    end
  end

  # Test suite for POST /urls
  describe 'POST /urls' do
    # valid payload
    let(:valid_attributes) { { url: 'http://www.google.com', code: 'a1b2c3d4e5' } }

    context 'when the request is valid' do
      before { post '/urls', params: valid_attributes }

      it 'creates a todo' do
        expect(json['url']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/urls', params: { url: 'http://www.google.com' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Code by can't be blank/)
      end
    end
  end

  # Test suite for PUT /urls/:id
  describe 'PUT /urls/:id' do
    let(:valid_attributes) { { url: 'http://www.yahoo.com' } }

    context 'when the record exists' do
      before { put "/urls/#{url_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /urls/:id
  describe 'DELETE /urls/:id' do
    before { delete "/urls/#{url_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end