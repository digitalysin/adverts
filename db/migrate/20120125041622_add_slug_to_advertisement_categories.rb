class AddSlugToAdvertisementCategories < ActiveRecord::Migration
  def self.up
    add_column :advertisement_categories, :slug, :string
  end

  def self.down
    remove_column :advertisement_categories, :slug
  end
end
