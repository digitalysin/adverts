class CreateSiteConfigurations < ActiveRecord::Migration
  def self.up
    create_table :site_configurations do |t|
      t.string :site_name
      t.string :site_title
      t.string :meta_keyword
      t.string :meta_description
      t.string :language
      t.string :charset
      t.string :site_footer
      t.string :time_zone
      t.date :session_time
      t.boolean :session_use_db
      t.boolean :session_match_ip
      t.boolean :session_match_browser
      t.string :header
      t.string :admin_email
      t.string :admin_name

      t.timestamps
    end
  end

  def self.down
    drop_table :site_configurations
  end
end
