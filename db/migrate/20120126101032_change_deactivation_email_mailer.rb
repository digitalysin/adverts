class ChangeDeactivationEmailMailer < ActiveRecord::Migration
  def self.up
    change_table :mailers do |t|
      t.remove :deactivation_email
      t.text :deactivation_email
    end
  end

  def self.down
    change_table :mailers do |t|
      t.remove :deactivation_email
      t.string :deactivation_email
    end
  end
end
