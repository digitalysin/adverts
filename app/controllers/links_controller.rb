class LinksController < ApplicationController
  before_filter :initialize_variables
  def index
    @link = Link.new
  end
  
  def create
    @link = Link.new params[:link]
    respond_to do |format|
      if @link.save
        LinkMailer.confirmation_email(@link).deliver
        format.html do redirect_to links_url, :notice => "link successfully created!" end
      else
        format.html do render :action => "index" end
      end
    end
  end
  
  private
    def initialize_variables
      @current_page = "link"
      @link_page    = Page.find_by_model_for :link
    end

end
