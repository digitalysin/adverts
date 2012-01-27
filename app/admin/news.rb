ActiveAdmin.register News do
  config.clear_sidebar_sections!
  config.clear_action_items!
  
  action_item :only => :edit do
    link_to "Back", admin_news_index_path
  end
  action_item :only => :index do
    link_to "New News", new_admin_news_path
  end 
  action_item :only => :show do
    link_to("Back", admin_news_index_path) + link_to("Edit", edit_admin_news_path(resource))
  end
  scope :published
  scope :unpublished
  index do
    column :title
    column :slug
    column :enabled
    column :created_at, :sortable => :created_at do |news|
      news.created_at.strftime "%d-%m-%Y"
    end
    default_actions
  end
  
  show do
    panel "News Detail" do
      attributes_table_for news do
        row :title
        row :content do
          news.content.html_safe
        end
        row :slug
        row :enabled
        row :created_at
        row :updated_at
      end
    end
  end
end
