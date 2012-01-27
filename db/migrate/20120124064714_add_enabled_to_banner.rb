class AddEnabledToBanner < ActiveRecord::Migration
  def self.up
    add_column :banners, :enabled, :boolean
  end

  def self.down
    remove_column :banners, :enabled
  end
end
