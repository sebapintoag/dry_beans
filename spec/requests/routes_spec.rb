require 'rails_helper'

RSpec.describe "Routes", type: :request do
  let!(:routes) { create_list(:route, 10) }

  describe "GET /index" do
    before { get('/routes') }
    it 'returns all routes' do
      expect(JSON.parse(response.body)['routes'].length).to be 10
    end

    it 'returns status code 200' do
      expect(response.status).to be 200
    end
  end

  describe "GET /show/:id" do
    context 'with a valid id' do
      before { get("/routes/#{routes.first.id}") }
      it 'returns requested route' do
        expect(JSON.parse(response.body)['route']['id']).to be routes.first.id
      end

      it 'returns status code 200' do
        expect(response.status).to be 200
      end
    end

    context 'with an invalid id' do
      before { get('/routes/121212121') }
      it 'returns status code 404' do
        expect(response.status).to be 404
      end
    end
  end
end
