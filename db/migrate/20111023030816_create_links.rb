class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :anchor
      t.string :website
      t.integer :link_price_id
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
