class Movement < ApplicationRecord
    belongs_to :movable, polymorphic: true
end
