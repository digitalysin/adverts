class CreateAdvertisementPrices < ActiveRecord::Migration
  def self.up
    create_table :advertisement_prices do |t|
      t.string :name
      t.float :price
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisement_prices
  end
end
