class AdvertisementPrice < ActiveRecord::Base
  has_many :advertisements
  class << self
    def update_all_prices_with(new_price)
      all.each do |a|
        a.update_attributes(:name => "#{a.id} Bulan Rp. #{new_price * a.id}", :price => a.id * new_price)
      end
    end
  end
end
