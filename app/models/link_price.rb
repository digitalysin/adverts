class LinkPrice < ActiveRecord::Base
  has_many :links
  validates_numericality_of :price, :message => "is not number"
end
