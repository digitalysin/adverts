class CreateAdvertisementTypes < ActiveRecord::Migration
  def self.up
    create_table :advertisement_types do |t|
      t.string :name
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisement_types
  end
end
