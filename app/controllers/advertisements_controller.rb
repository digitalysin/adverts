class AdvertisementsController < ApplicationController
  before_filter :initialize_variables
  def index
    @advertisement = Advertisement.new
  end
  
  def create
    @advertisement = Advertisement.new params[:advertisement]
    respond_to do |format| 
      if @advertisement.save
        AdvertisementMailer.confirmation_email(@advertisement).deliver
        format.html do redirect_to advertisements_path, :notice => "Pemasangan iklan anda akan segera kami proses" end
      else
        format.html do render :action => :index end
      end
    end
  end
  
  def show
    @advertisement = Advertisement.where(:slug => params[:id]).first
    render :file => "#{Rails.root}/public/404.html", :status => :not_found unless @advertisement.present?
    if @advertisement.times_readed.nil?
      @advertisement.times_readed = 1
    else
      @advertisement.times_readed += 1
    end
    @advertisement.save
  end
  
  private
    def initialize_variables
      @current_page       = "advertisement"
      @advertisement_page = Page.find_by_model_for :advertisement
    end
end
