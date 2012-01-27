class BannersController < ApplicationController
  before_filter :initialize_variables
  def index
    @banner = Banner.new
  end
  
  def create
    @banner = Banner.new params[:banner]
    respond_to do |format|
      if @banner.save
        BannerMailer.confirmation_email(@banner).deliver
        format.html do redirect_to banners_path, :notice => "Permintaan pemasangan banner anda akan segera kami proses" end
      else
        format.html do render :action => :index  end
      end
    end
  end
  
  private
    def initialize_variables
      @current_page = "banner"
      @banner_page  = Page.find_by_model_for :banner
    end

end
