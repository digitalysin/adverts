ActiveAdmin.register Network do
  scope :yahoo_messenger
  scope :affiliate_network
  config.clear_action_items!
  action_item :only => :index do
    link_to "New Network", new_admin_network_path
  end
  action_item :only => :show do
    link_to("Back", admin_networks_path) + link_to("Edit", edit_admin_network_path(resource))
  end
  action_item :only => :edit do
    link_to "Back", admin_network_path(resource)
  end
  index do
    column :name
    column :site
    column :enabled
    column :network_type do |network|
      network.network_type == "site" ? "Affiliate Network" : "Yahoo Messeger"
    end
    default_actions
  end
  show do
    panel "Network Detail" do
      attributes_table_for network do
        row :name
        row :site
        row :enabled
        row :network_type do
          network.network_type == "site" ? "Affiliate Network" : "Yahoo Messeger"
        end
      end
    end
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :site 
      f.input :enabled
      f.input :network_type, :as => :select ,:include_blank => false, :collection => {"Yahoo Messenger" => :messenger, "Affiliate Network" => :site}
    end
    f.buttons
  end
end
