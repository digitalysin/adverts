class CreateAdvertisementCategories < ActiveRecord::Migration
  def self.up
    create_table :advertisement_categories do |t|
      t.string :name
      t.boolean :enabled
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisement_categories
  end
end
