class Thing < ApplicationRecord
    belongs_to :user
    
    validates :name, presence: true, length: {maximum: 255 }
    validates :date, presence: true
    validates :shop, presence: true
    validates :highprice, presence: true
    validates :lowprice, presence: true
    
    def save_price
        if self.shop == "super"
            self.lowprice
        else
            self.highprice
        end
    end
    
end
