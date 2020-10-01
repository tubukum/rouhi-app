class Thing < ApplicationRecord
    validates :name, presence: true, length: {maximum: 255 }
    validates :name, presence: true
end
