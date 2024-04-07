class Movable::Delivery < ApplicationRecord
    has_one :movement, as: :movable, dependent: :destroy
end
