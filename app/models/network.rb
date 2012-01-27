class Network < ActiveRecord::Base
  scope :yahoo_messenger, where(:network_type => :messenger)
  scope :affiliate_network, where(:network_type => :site)
  validates_presence_of :name,:site,:network_type
  
  scope :messenger, where(:enabled => true, :network_type => :messenger).limit(3)
  scope :affiliate, where(:enabled => true, :network_type => :site).order("rand(),created_at").limit(10)
end
