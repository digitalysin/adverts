class AddImageToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :image, :string
  end

  def self.down
    remove_column :banners, :image
  end
end
