require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  setup do
    @contact = contacts :two
    @contact.update_attributes :name=>"",:email => "", :address => ""
  end
  test "should error if name is empty" do
    assert @contact.errors.include? :name
  end
  
  test "should error if address is empty" do
    assert @contact.errors.include? :address
  end
  
  test "should error if email is empty" do
    assert @contact.errors.include? :email
    
  end
  
  test "should error if email is invalid" do
    @contact.email = "invalid_email_address"
    @contact.valid?
    assert_equal @contact.errors[:email].first, "is invalid"
  end
end
