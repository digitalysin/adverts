class CreateMailers < ActiveRecord::Migration
  def self.up
    create_table :mailers do |t|
      t.text :confirmation_email
      t.text :regular_email
      t.text :activation_email
      t.string :deactivation_email
      t.string :model_for

      t.timestamps
    end
  end

  def self.down
    drop_table :mailers
  end
end
