class Advertisement < ActiveRecord::Base
  belongs_to :advertisement_category
  belongs_to :advertisement_type
  belongs_to :advertisement_price
  
  validates_presence_of :name, :email, :phone, :title, :site, :content, :tag, :image
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "is invalid"
  
  mount_uploader :image, AdvertisementUploader
  before_destroy :before_destroy_callback
  before_save :before_save_callback
  
  scope :free_ads, where(:enabled => true, :advertisement_type_id => 1)
  scope :premium_ads, where(:enabled => true, :advertisement_type_id => 2)
  scope :by_title, lambda { |enabled,title| where("enabled = ? and title like ?",enabled,"%#{title}%").order("advertisement_type_id desc") }
  
  private
    def before_destory_callback
      self.remove_image if self.image.present?
    end
    
    def before_save_callback
      if self.slug.present?
        self.slug = self.slug.parameterize
      else
        self.slug = self.title.parameterize
      end
    end
end
