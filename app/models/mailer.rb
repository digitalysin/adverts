class Mailer < ActiveRecord::Base
  scope :banner_mailer, where(:id => 1)
  scope :link_mailer, where(:id => 2)
  scope :premium_advertisement_mailer, where(:id => 3)
  scope :free_advertisement_mailer, where(:id => 4)
  scope :contact_mailer, where(:id => 5)
end
