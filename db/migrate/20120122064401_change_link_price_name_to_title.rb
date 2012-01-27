class ChangeLinkPriceNameToTitle < ActiveRecord::Migration
  def self.up
    change_table :link_prices do |t|
      t.remove :title
      t.string :name
    end
  end

  def self.down
    change_table :link_prices do |t|
      t.remove :name
      t.string :title
    end
  end
end
