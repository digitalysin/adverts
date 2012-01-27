class LinkPrice < ActiveRecord::Base
  has_many :links
  validates_numericality_of :price, :message => "is not number"
  
  class << self
    def update_all_prices_with(new_price)
      all.each do |lp| lp.update_attributes(:price => lp.id * new_price, :name => "Harga #{lp.id} Bulan Rp. #{lp.id * new_price}") end
    end
  end
end
