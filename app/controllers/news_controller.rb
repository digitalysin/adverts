class NewsController < ApplicationController
  def index
    @news = News.find_by_slug params[:slug]
    render "#{Rails.root}/public/404.html", :status => :not_found unless @news.present?
  end
end
