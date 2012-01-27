class AddNetworkTypeToNetworks < ActiveRecord::Migration
  def self.up
    add_column :networks, :network_type, :string
  end

  def self.down
    remove_column :networks, :network_type
  end
end
