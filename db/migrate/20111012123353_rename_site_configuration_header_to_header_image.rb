class RenameSiteConfigurationHeaderToHeaderImage < ActiveRecord::Migration
  def self.up
    change_table :site_configurations do |t|
      t.rename :header , :header_image
    end
  end

  def self.down
    change_table :site_configurations do |t|
      t.rename :header_image, :header
    end
  end
end
