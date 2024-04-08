# frozen_string_literal: true

NAMES = [
  'Amberly Short', 'Ceferino Hardy', 'Altagracia Marley',
  'Desi Dodge', 'Praise Rey', 'Bill Rivera', 'Jacqui Antonio',
  'Rue Starr', 'Zoey Abbey', 'Joe Summers', 'Tillie Parrish',
  'Royce Holland', 'Marvin Braxton', 'Hildred Finch', 'Sammie Leach'
].freeze

r1 = Route.create(
  code: 'R01',
  starting_point: 'R01 warehouse',
  destination_point: 'R01_ALT warehouse',
  vehicle_plate: 'FKMR01'
)

%w[T101 T102 T103 T104 T105 T106 T107].each_with_index do |code, index|
  t = Trip.create(
    code: "#{r1.code}_#{code}",
    route: r1,
    destination_person_name: NAMES.sample,
    destination_person_phone: (SecureRandom.random_number * 100_000_000).to_i.to_s,
    destination_address: "#{NAMES.sample} ##{(SecureRandom.random_number * 1000).to_i}",
    destination_lat: [-1, 1].sample * SecureRandom.random_number * 100,
    destination_lng: [-1, 1].sample * SecureRandom.random_number * 100,
    estimated_arrival_at: (1 + index).hours.from_now
  )
  Delivery.create(trip: t)
  Delivery.create(trip: t)
end

r2 = Route.create(
  code: 'R02',
  starting_point: 'R02 warehouse',
  destination_point: 'R02_ALT warehouse',
  vehicle_plate: 'FKMR02'
)

%w[T101 T102 T103 T104 T105 T106 T107].each_with_index do |code, index|
  t = Trip.create(
    code: "#{r2.code}_#{code}",
    route: r2,
    destination_person_name: NAMES.sample,
    destination_person_phone: (SecureRandom.random_number * 100_000_000).to_i.to_s,
    destination_address: "#{NAMES.sample} ##{(SecureRandom.random_number * 1000).to_i}",
    destination_lat: [-1, 1].sample * SecureRandom.random_number * 100,
    destination_lng: [-1, 1].sample * SecureRandom.random_number * 100,
    estimated_arrival_at: (1 + index).hours.from_now
  )
  Delivery.create(trip: t)
  Delivery.create(trip: t)
end

r3 = Route.create(
  code: 'R03',
  starting_point: 'R03 warehouse',
  destination_point: 'R03_ALT warehouse',
  vehicle_plate: 'FKMR03'
)

%w[T101 T102 T103 T104 T105 T106 T107].each_with_index do |code, index|
  t = Trip.create(
    code: "#{r3.code}_#{code}",
    route: r3,
    destination_person_name: NAMES.sample,
    destination_person_phone: (SecureRandom.random_number * 100_000_000).to_i.to_s,
    destination_address: "#{NAMES.sample} ##{(SecureRandom.random_number * 1000).to_i}",
    destination_lat: [-1, 1].sample * SecureRandom.random_number * 100,
    destination_lng: [-1, 1].sample * SecureRandom.random_number * 100,
    estimated_arrival_at: (1 + index).hours.from_now
  )
  Delivery.create(trip: t)
  Pickup.create(trip: t)
end

%w[R04 R05 R06 R07 R08].each do |code|
  r = Route.create(
    code:,
    starting_point: "#{code} warehouse",
    destination_point: "#{code}_ALT warehouse",
    vehicle_plate: "FKM#{code}"
  )
  %w[T101 T102 T103 T104 T105 T106 T107].each_with_index do |code, index|
    t = Trip.create(
      code: "#{r.code}_#{code}",
      route: r,
      destination_person_name: NAMES.sample,
      destination_person_phone: (SecureRandom.random_number * 100_000_000).to_i.to_s,
      destination_address: "#{NAMES.sample} ##{(SecureRandom.random_number * 1000).to_i}",
      destination_lat: [-1, 1].sample * SecureRandom.random_number * 100,
      destination_lng: [-1, 1].sample * SecureRandom.random_number * 100,
      estimated_arrival_at: (1 + index).hours.from_now
    )
    [1, 2, 3].sample.times do |_i|
      case %i[delivery pickup both].sample
      when :delivery
        Delivery.create(trip: t)
      when :pickup
        Pickup.create(trip: t)
      else
        Delivery.create(trip: t)
        Pickup.create(trip: t)
      end
    end
  end
end

'''
Route.all.each do |route|
    %w[T101 T102 T103 T104 T105 T106 T107].each_with_index do |code, index|
        Trip.create(
            code: "#{route.code}_code",
            route: route,
            destination_person_name: NAMES.sample,
            destination_person_phone: (SecureRandom.random_number*100000000).to_i.to_s,
            destination_address: "#{NAMES.sample} ##{(SecureRandom.random_number*1000).to_i}",
            destination_lat: [-1, 1].sample * SecureRandom.random_number*100,
            destination_lng: [-1, 1].sample * SecureRandom.random_number*100,
            estimated_arrival_at: (1 + index).hours.from_now
        )
    end
end

Trip.all.each do |trip|
    [1, 2, 3].sample.times do |i|
        case [:delivery, :pickup, :both].sample
        when :delivery
            Delivery.create(trip: trip)
        when :pickup
            Pickup.create(trip: trip)
        else
            Delivery.create(trip: trip)
            Pickup.create(trip: trip)
        end
    end
end
'''
