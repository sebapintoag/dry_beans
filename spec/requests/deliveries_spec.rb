require 'rails_helper'

RSpec.describe "Deliveries", type: :request do
  let!(:delivery) { create(:delivery) }

  describe "PUT /deliveries/:id/deliver" do
    context 'with a valid id' do
      context 'with a pending delivery' do
        before do
          params = {
            "delivery": {
              "receiver_name": "Juan Pino",
              "receiver_phone": "55566665",
              "receiver_legal_id": "11.111.111-1",
              "proof_of_delivery": "This should be something better"
            }
          }
          put("/deliveries/#{delivery.id}/deliver", params: params)
        end
        it 'delivers delivery' do
          expect(delivery.reload.state).to eq('delivered')
        end

        it 'returns updated delivery' do
          expect(JSON.parse(response.body)['delivery']['state']).to eq('delivered')
        end

        it 'saves receiver_name' do
          expect(delivery.reload.receiver_name).to eq('Juan Pino')
        end

        it 'saves receiver_phone' do
          expect(delivery.reload.receiver_phone).to eq('55566665')
        end

        it 'saves receiver_legal_id' do
          expect(delivery.reload.receiver_legal_id).to eq('11.111.111-1')
        end

        it 'saves proof_of_delivery' do
          expect(delivery.reload.proof_of_delivery).to eq('This should be something better')
        end

        it 'returns status code 200' do
          expect(response.status).to be 200
        end
      end
      context 'with an already delivered delivery' do
        before do
          delivery.deliver!
          params = {
            "delivery": {
              "receiver_name": "Juan Pino",
              "receiver_phone": "55566665",
              "receiver_legal_id": "11.111.111-1",
              "proof_of_delivery": "This should be something better"
            }
          }
          put("/deliveries/#{delivery.id}/deliver", params: params)
        end
        it 'returns status code 400' do
          expect(response.status).to be 400
        end
      end
      context 'without reception data' do
        before { put("/deliveries/#{delivery.id}/deliver") }
        it 'returns status code 400' do
          expect(response.status).to be 400
        end
      end
    end

    context 'with an invalid id' do
      before { get('/deliveries/212121211/deliver') }
      it 'returns status code 404' do
        expect(response.status).to be 404
      end
    end
  end
end
