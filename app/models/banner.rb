class Banner < ActiveRecord::Base
  belongs_to :banner_category
  validates_presence_of :name, :email, :phone, :site, :content, :image
  mount_uploader :image, BannerUploader
  before_destroy :before_destroy_callback
  
  scope :banner_b1, where(:enabled => true, :banner_category_id => 2).includes(:banner_category).order("random(),created_at").limit(7)
  scope :banner_b2, where(:enabled => true, :banner_category_id => 3).includes(:banner_category).order("random(),created_at")
  scope :banner_b3, where(:enabled => true, :banner_category_id => 4).includes(:banner_category).order("random(),created_at")
  scope :banner_b4, where(:enabled => true, :banner_category_id => 5).includes(:banner_category).order("random(),created_at")
  scope :banner_header, where(:enabled => true, :banner_category_id => 1).includes(:banner_category).limit(1)
  
  private
    def before_destroy_callback
      self.remove_image if self.image.present?
    end
end
