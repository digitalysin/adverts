class AddEnabledToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :enabled, :boolean
  end

  def self.down
    remove_column :advertisements, :enabled
  end
end
