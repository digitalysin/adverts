class CreateVisitors < ActiveRecord::Migration
  def self.up
    create_table :visitors do |t|
      t.string :ip_address
      t.string :path_info
      t.date :date_visited

      t.timestamps
    end
  end

  def self.down
    drop_table :visitors
  end
end
