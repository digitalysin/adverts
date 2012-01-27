class AddImageToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :image, :string
  end

  def self.down
    remove_column :advertisements, :image
  end
end
