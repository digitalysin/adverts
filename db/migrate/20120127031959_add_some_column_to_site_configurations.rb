class AddSomeColumnToSiteConfigurations < ActiveRecord::Migration
  def self.up
    change_table :site_configurations do |t|
      t.integer :maximum_premium_ads_per_page
      t.integer :maximum_free_ads_per_page
      t.integer :minimum_content_ads
      t.text :exlucsion_words
      t.float :price_premium_ads_per_month
      t.float :price_links_per_month
    end
  end

  def self.down
    change_table :site_configurations do |t|
      t.remove :maximum_premium_ads_per_page
      t.remove :maximum_free_ads_per_page
      t.remove :minimum_content_ads
      t.remove :exclusion_words
      t.remove :price_premium_ads_per_month
      t.remove :price_links_per_month
    end
  end
end
