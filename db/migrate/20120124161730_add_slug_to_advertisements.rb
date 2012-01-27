class AddSlugToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :slug, :string
  end

  def self.down
    remove_column :advertisements, :slug
  end
end
