class AddSlugToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :slug, :string
  end

  def self.down
    remove_column :news, :slug
  end
end
