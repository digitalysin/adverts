class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_application_variables
  
  private
    def initialize_application_variables
      # fuck ... why this method crash with activeadmin ...
      unless request.env['PATH_INFO'] == "/admin"
        Visitor.check_visitor request.env['REMOTE_ADDR'], request.env['PATH_INFO']
        @statistic = Statistic.first
        @site_configuration = SiteConfiguration.first
        @premium_advertisements = Advertisement.premium_ads.limit(@site_configuration.maximum_premium_ads_per_page)
        @free_advertisements = Advertisement.free_ads.page(params[:page]).per(@site_configuration.maximum_free_ads_per_page)
        
        unless Statistic.today?
          Statistic.update_advertisements
        end      
      end
    end
end
