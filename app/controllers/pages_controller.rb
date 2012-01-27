class PagesController < ApplicationController
  def index
    @page = Page.regular_pages.first
    respond_to do |format|
      format.html
    end
    
  end
  
  def show
    @page = Page.find_by_slug params[:id]
    respond_to do |format|
      if @page.present?
        format.html
      else
        format.html do redirect_to pages_url end
      end
    end
  end

end
