ActiveAdmin.register SiteConfiguration do 
  config.clear_sidebar_sections!
  config.clear_action_items!
  
  action_item :only => :show do
    link_to("Back", admin_site_configurations_path) + link_to("Edit", edit_admin_site_configuration_path(resource))
  end
  action_item :only => :edit do
    link_to "Back", admin_site_configurations_path
  end
  
  index do
    column :site_title
    column :site_name
    column :header_image do |sc|
      image_tag sc.header_image_url(:small).to_s
    end
    column :action do |sc|
      link_to("View", admin_site_configuration_path(sc)) + " | " + link_to("Edit", edit_admin_site_configuration_path(sc))
    end
  end
  
  form :html => {:multipart => true } do |f|
    f.inputs do
      f.input :site_title
      f.input :site_name
      f.input :meta_keyword
      f.input :meta_description
      f.input :maximum_premium_ads_per_page
      f.input :maximum_free_ads_per_page
      f.input :minimum_content_ads, :label => "Minimum content words"
      f.input :exclusion_words, :as => :text, :input_html => {:rows => 7}, :hint => "Separated by comma, eg : porn,junk,sex"
      f.input :price_premium_ads_per_month
      f.input :price_links_per_month
      f.input :site_footer, :as => :text, :input_html => {:rows => 7}
      f.input :header_image, :as => :file
      f.input :admin_email, :label => "Administrator Email"
      f.input :admin_name, :label => "Administrator Name"
    end
    f.buttons
  end
  
  show do
    panel "Site Configuration Detail" do
      attributes_table_for resource do
        row :site_title
        row :site_name
        row :meta_keyword
        row :meta_description
        row :maximum_premium_ads_per_page
        row :maximum_free_ads_per_page
        row :minimum_content_ads
        row :exclusion_words
        row :price_premium_ads_per_month
        row :price_links_per_month
        row :site_footer do 
          resource.site_footer.html_safe
        end
        row :admin_email
        row :admin_name
        row :header_image do
          image_tag resource.header_image_url(:small).to_s if resource.header_image?
        end 
      end
    end
  end
  
end
