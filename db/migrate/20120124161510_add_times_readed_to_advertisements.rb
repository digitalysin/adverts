class AddTimesReadedToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :times_readed, :integer
  end

  def self.down
    remove_column :advertisements, :times_readed
  end
end
