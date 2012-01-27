class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :website
      t.string :phone
      t.text :message
      t.boolean :message_status
      t.datetime :message_send_at

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
