class CategoryController < ApplicationController
  def index
    @advertisement_category = AdvertisementCategory.by_slug(params[:slug]).first
    @advertisements = @advertisement_category.advertisements.order("advertisement_type_id desc")
  end
end
