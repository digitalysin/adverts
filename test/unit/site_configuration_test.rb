require 'test_helper'

class SiteConfigurationTest < ActiveSupport::TestCase
  
  test "should error if site name is empty" do
    sc = SiteConfiguration.create :site_name => ""
    assert sc.errors.include? :site_name
  end
  
  test "should error if site title is empty" do
    sc = SiteConfiguration.create :site_title => ""
    assert sc.errors.include? :site_title 
  end
  
  test "site configuration table should emtpy if drop all method called" do
    SiteConfiguration.drop_all
    assert_equal SiteConfiguration.count, 0
  end
end
