class SearchController < ApplicationController
  def index
    @advertisements = Advertisement.by_title(true,params[:query])
  end
end
