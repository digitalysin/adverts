class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_application_variables
  
  private
    def initialize_application_variables
      Visitor.check_visitor request.env['REMOTE_ADDR'], request.env['PATH_INFO']
      @statistic = Statistic.first
      @site_configuration = SiteConfiguration.first 
      Statistic.update_advertisements unless Statistic.today?
    end
end