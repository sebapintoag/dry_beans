require 'rails_helper'

RSpec.describe Delivery, type: :model do
  describe 'associations' do
    it { should belong_to(:trip) }
  end

  describe 'validations' do
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:trip) }
  end

  describe 'states' do
    let(:delivery) {create(:delivery)}

    context 'when delivery is pending' do
      it 'may transition to delivered' do
        expect(delivery.may_deliver?).to be_truthy
      end
      it 'may transition to postponed' do
        expect(delivery.may_postpone?).to be_truthy
      end
      it 'may transition to rejected' do
        expect(delivery.may_reject?).to be_truthy
      end
    end

    context 'when delivery is delivered' do
      before { delivery.deliver! }

      it 'sets delivered_at field' do
        expect(delivery.delivered_at).not_to be_blank
      end
    end

    context 'when delivery is postponed' do
      before { delivery.postpone! }

      it 'sets postponed_at field' do
        expect(delivery.postponed_at).not_to be_blank
      end
    end

    context 'when delivery is rejected' do
      before { delivery.reject! }

      it 'sets rejected_at field' do
        expect(delivery.rejected_at).not_to be_blank
      end
    end
  end
end
