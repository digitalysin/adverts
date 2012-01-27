class News < ActiveRecord::Base
  scope :published , where(:enabled => true)
  scope :unpublished, where(:enabled => false)
  before_save :before_save_callback
  validates_presence_of :title,:content
  
  class << self
    def get_all_news_titles
      where(:enabled => true).order(:title).all.map(&:title).join(" | ").downcase
    end
  end
  
  private
    def before_save_callback
      if self.slug.present?
        self.slug = self.slug.parameterize
      else
        self.slug = self.title.parameterize
      end
    end
end
