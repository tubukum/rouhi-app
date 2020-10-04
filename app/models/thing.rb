class Thing < ApplicationRecord
    validates :name, presence: true, length: {maximum: 255 }
    validates :date, presence: true
    validates :shop, presence: true
    validates :highprice, presence: true
    validates :lowprice, presence: true
end
