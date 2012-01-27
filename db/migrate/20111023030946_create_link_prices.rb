class CreateLinkPrices < ActiveRecord::Migration
  def self.up
    create_table :link_prices do |t|
      t.string :title
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :link_prices
  end
end
