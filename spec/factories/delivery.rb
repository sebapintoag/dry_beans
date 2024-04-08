# frozen_string_literal: true

FactoryBot.define do
  factory :delivery do
    association :trip
  end
end
