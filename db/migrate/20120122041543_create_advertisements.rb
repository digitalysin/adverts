class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :phone
      t.integer :advertisement_category_id
      t.integer :advertisement_price_id
      t.integer :advertisement_type_id
      t.string :title
      t.string :site
      t.string :content
      t.string :tag

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
