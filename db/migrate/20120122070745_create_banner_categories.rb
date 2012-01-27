class CreateBannerCategories < ActiveRecord::Migration
  def self.up
    create_table :banner_categories do |t|
      t.string :name
      t.float :price
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :banner_categories
  end
end
