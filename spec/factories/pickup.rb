# frozen_string_literal: true

FactoryBot.define do
  factory :pickup do
    association :trip
  end
end
