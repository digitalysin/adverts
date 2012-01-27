class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :banner_category_id
      t.integer :how_long
      t.string :site
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
