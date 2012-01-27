require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  setup do
    @link = links :one
  end
  test "should error if anchor, website, name, email, phone is empty" do
    @link.update_attributes :name=>"",:website => "", :anchor => "", :email => "", :phone => ""
    @link.valid?
    assert @link.errors.include? :name
    assert @link.errors.include? :website
    assert @link.errors.include? :anchor
    assert @link.errors.include? :email
    assert @link.errors.include? :phone
  end
  
  test "should error if email contain wrong format" do
    @link.update_attributes :email=>"invalid_email"
    assert_equal @link.errors[:email].size, 1
    assert_equal @link.errors[:email].first , "invalid email format"
  end
  
  test "should error if website contain wrong url" do
    flunk "URL validation not implemented yet !!!"
  end
end
