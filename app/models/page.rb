class Page < ActiveRecord::Base
  validates_presence_of :title, :content
  before_save :before_save_callback
  
  scope :regular_pages, where(:model_for => nil)
  
  private 
    def before_save_callback
      if self.slug.present?
        self.slug = self.slug.parameterize
      else
        self.slug = self.title.parameterize
      end
    end
end
