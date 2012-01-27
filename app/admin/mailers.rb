ActiveAdmin.register Mailer do
  config.clear_sidebar_sections!
  config.clear_action_items!
  
  action_item :only => :show do
    link_to("Back", admin_mailers_path) + link_to("Edit", edit_admin_mailer_path(resource))
  end
  
  action_item :only => :edit do
    link_to "Back", admin_mailers_path
  end
  
  index do
    column :confirmation_email  do |m| truncate(m.confirmation_email, :length => 100) end
    column :regular_email       do |m| truncate(m.regular_email, :length => 100) end
    column :activation_email    do |m| truncate(m.activation_email, :length => 100) end
    column :deactivation_email  do |m| truncate(m.deactivation_email, :length => 100) end
    column :email_template_for  do |m| m.model_for.humanize end
    column :action do |m|
      link_to("View", admin_mailer_path(m)) + " | " + link_to("Edit", edit_admin_mailer_path(m))
    end
  end
  
  show do
    panel "Mailer Detail" do
      attributes_table_for mailer do
        row :confirmation_email   do truncate mailer.confirmation_email.html_safe, :length => 200 end
        row :regular_email        do truncate mailer.regular_email.html_safe, :length => 200 end
        row :activation_email     do truncate mailer.activation_email.html_safe, :length => 200 end
        row :deactivation_email   do truncate mailer.deactivation_email.html_safe, :length => 200 end
      end
    end
  end 

  form do |f|
    f.inputs do
      f.input :confirmation_email, :as => :text, :input_html => {:rows => 7, :class => :ckeditor}
      f.input :regular_email, :as => :text, :input_html => {:rows => 7, :class => :ckeditor}
      f.input :activation_email, :as => :text, :input_html => {:rows => 7, :class => :ckeditor}
      f.input :deactivation_email, :as => :text, :input_html => {:rows => 7, :class => :ckeditor}
    end
    f.buttons
  end
end
