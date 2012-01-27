ActiveAdmin.register Page do
  config.clear_sidebar_sections! 
  config.clear_action_items!
  
  action_item :only => :show do
    link_to("Back", admin_pages_path) + link_to("Edit", edit_admin_page_path(resource))
  end
  
  action_item :only => :edit do
    link_to("Back", admin_page_path(resource))
  end
  
  action_item :only => :index do
    link_to "New Page", new_admin_page_path
  end 
  
  index do 
    column :title
    column :slug
    column :enabled
    column :action do |page|
      unless %w(advertisement banner link contact).include? page.model_for.to_s
        link_to("View", admin_page_path(page)) + " | " + 
        link_to("Edit", edit_admin_page_path(page)) + " | " + 
        link_to("Delete", admin_page_path(page), :method => :delete)
      else
        link_to("View", admin_page_path(page)) + " | " + 
        link_to("Edit", edit_admin_page_path(page))
      end
    end
  end

  show do
    panel "Page Detail" do
      attributes_table_for page do
        row :title
        row :content do
          page.content.html_safe
        end
        row :slug
        row :meta_content
        row :meta_keyword
        row :enabled
      end
    end
  end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, :as => :text, :input_html => {:class => "ckeditor"}
      f.input :slug
      f.input :meta_content
      f.input :meta_keyword
      f.input :enabled
    end
    f.buttons
  end
  
end
