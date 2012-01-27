class Link < ActiveRecord::Base
  belongs_to :link_price
  validates_presence_of :website, :name, :email, :phone
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "invalid email format"  
end
