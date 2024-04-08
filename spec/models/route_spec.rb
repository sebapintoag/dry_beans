# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'associations' do
    it { should have_many(:trips) }
  end

  describe 'validations' do
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:starting_point) }
  end

  describe 'states' do
    let(:route) { create(:route) }

    context 'when route is created' do
      it 'may transition to approved' do
        expect(route.may_approve?).to be_truthy
      end

      it 'may transition to cancelled' do
        expect(route.may_cancel?).to be_truthy
      end
    end

    context 'when route is approved' do
      before { route.approve! }

      it 'sets approved_at field' do
        expect(route.approved_at).not_to be_blank
      end

      it 'may transition to started' do
        expect(route.may_start?).to be_truthy
      end

      it 'may transition to cancelled' do
        expect(route.may_cancel?).to be_truthy
      end
    end

    context 'when route is started' do
      before do
        route.approve!
        route.start!
      end

      it 'sets started_at field' do
        expect(route.started_at).not_to be_blank
      end

      it 'may transition to finished' do
        expect(route.may_finish?).to be_truthy
      end
    end

    context 'when route is finished' do
      before do
        route.approve!
        route.start!
        route.finish!
      end

      it 'sets finished_at field' do
        expect(route.finished_at).not_to be_blank
      end
    end

    context 'when route is cancelled' do
      before { route.cancel! }

      it 'sets cancelled_at field' do
        expect(route.cancelled_at).not_to be_blank
      end
    end
  end

  describe 'methods' do
    let(:route) { build(:route) }

    context 'when model is going to be validated' do
      before { route.valid? }
      it 'generates code' do
        expect(route.code).to be_present
      end
    end
  end
end
