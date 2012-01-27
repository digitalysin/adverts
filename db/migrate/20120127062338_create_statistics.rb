class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.date :today
      t.integer :total_ads_for_today
      t.integer :total_ads_for_yesterday
      t.integer :total_ads
      t.integer :total_visit_for_today
      t.integer :total_visited

      t.timestamps
    end
  end

  def self.down
    drop_table :statistics
  end
end
