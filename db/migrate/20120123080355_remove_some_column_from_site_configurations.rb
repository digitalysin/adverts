class RemoveSomeColumnFromSiteConfigurations < ActiveRecord::Migration
  def self.up
    change_table :site_configurations do |t|
      t.remove :language
      t.remove :charset
      t.remove :time_zone
      t.remove :session_time
      t.remove :session_use_db
      t.remove :session_match_ip
      t.remove :session_match_browser
    end
  end

  def self.down
    change_table :site_configurations do |t|
      t.string  :language
      t.string  :charset
      t.string  :time_zone
      t.date    :session_time
      t.boolean :session_use_db
      t.boolean :session_match_ip
      t.boolean :session_match_browser
    end
  end
end
