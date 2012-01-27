class SiteConfiguration < ActiveRecord::Base
  validates_presence_of :site_name, :site_title
  
  mount_uploader :header_image , SiteConfigurationUploader
  class << self
    def get_header_image
      first.header_image_url(:small)
    end
    
    def get_admin_email
      first.admin_email
    end
  end
end
