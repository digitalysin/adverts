ActiveAdmin.register BannerCategory do
  config.clear_action_items!
  action_item :only => :show do
    link_to "Back", admin_banner_categories_path
  end
  index do 
    column :name
    column :price, :sortable => :price do |bc|
      number_to_currency bc.price, :unit => "Rp.", :presicion => 0
    end
    column :enabled
    column "Action" do |bc|
      link_to("View", admin_banner_category_path(bc)) + " " + 
      link_to("Edit", edit_admin_banner_category_path(bc))
    end
  end
  
  show do
    panel "Banner Category Detail" do
      attributes_table_for banner_category do
        row :name
        row :price do number_to_currency(banner_category.price, :unit => "Rp.") end
        row :enabled do banner_category.enabled.present? ? "Yes" : "No" end
        row :created_at
        row :updated_at
      end
    end
  end
end
