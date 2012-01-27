class AdvertisementCategory < ActiveRecord::Base
  belongs_to :category, :class_name => "AdvertisementCategory"
  has_many :sub_category , :class_name => "AdvertisementCategory", :foreign_key => :category_id
  has_many :advertisements
  validates_presence_of :name
  before_save :before_save_callback
  
  scope :by_slug, lambda { |slug| where("enabled = ? and slug = ?",true,slug) }
  
  private
    def before_save_callback
      if self.slug.present?
        self.slug = self.slug.to_s.parameterize
      else
        self.slug = self.name.to.s.parameterize
      end
    end
end
