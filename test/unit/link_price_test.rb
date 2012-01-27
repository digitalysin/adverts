require 'test_helper'

class LinkPriceTest < ActiveSupport::TestCase
  setup do 
    @link_price = link_prices :one
    @link_price.price = "abc"
    @link_price.valid?
  end
  test "price should contain valid number" do
    assert @link_price.errors[:price].include? "is not number"
  end
end
