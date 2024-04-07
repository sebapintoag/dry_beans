class Movable::Pickup < ApplicationRecord
    has_one :movement, as: :movable, dependent: :destroy
end
