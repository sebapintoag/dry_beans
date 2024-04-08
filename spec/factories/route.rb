FactoryBot.define do
    factory :route do
        sequence(:code) { |i| "R0#{i}" }
        sequence(:starting_point) { |i| "R0#{i} warehouse" }
        sequence(:destination_point) { |i| "R0#{i}_ALT warehouse" }
        sequence(:vehicle_plate) { |i| "FKMR#{i}" }
    end
  end
  