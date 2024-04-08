# frozen_string_literal: true

NAMES = [
  'Amberly Short', 'Ceferino Hardy', 'Altagracia Marley',
  'Desi Dodge', 'Praise Rey', 'Bill Rivera', 'Jacqui Antonio',
  'Rue Starr', 'Zoey Abbey', 'Joe Summers', 'Tillie Parrish',
  'Royce Holland', 'Marvin Braxton', 'Hildred Finch', 'Sammie Leach'
].freeze

FactoryBot.define do
  factory :trip do
    sequence(:code) { |i| "R01_V#{i}" }
    destination_person_name { NAMES.sample }
    destination_person_phone { (SecureRandom.random_number * 100_000_000).to_i.to_s }
    destination_address { "#{NAMES.sample} ##{(SecureRandom.random_number * 1000).to_i}" }
    destination_lat { [-1, 1].sample * SecureRandom.random_number * 100 }
    destination_lng { [-1, 1].sample * SecureRandom.random_number * 100 }
    sequence(:estimated_arrival_at) { |i| (1 + i).hours.from_now }

    association :route
  end
end
