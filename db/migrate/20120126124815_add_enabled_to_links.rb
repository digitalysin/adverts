class AddEnabledToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :enabled, :boolean
  end

  def self.down
    remove_column :links, :enabled
  end
end
