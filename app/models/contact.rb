class Contact < ActiveRecord::Base
  validates_presence_of :name,:address,:email,:phone,:message
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "is invalid"
end
