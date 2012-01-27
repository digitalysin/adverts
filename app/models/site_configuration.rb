class SiteConfiguration < ActiveRecord::Base
  validates_presence_of :site_name, :site_title
  mount_uploader :header_image , SiteConfigurationUploader
  before_save :before_save_callback
  
  class << self
    def get_header_image
      first.header_image_url(:small)
    end
    
    def get_admin_email
      first.admin_email
    end
    
    def get_exclusion_words
      first.exclusion_words
    end
    
    def get_minimum_content_ads
      first.minimum_content_ads.to_s.to_i
    end
  end
  
  private
    def before_save_callback
      AdvertisementPrice.update_all_prices_with self.price_premium_ads_per_month if self.price_premium_ads_per_month.present? and self.price_premium_ads_per_month > 0
      LinkPrice.update_all_prices_with self.price_links_per_month if self.price_links_per_month.present? and self.price_links_per_month > 0
    end
end
