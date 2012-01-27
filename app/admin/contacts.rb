ActiveAdmin.register Contact do
  member_action :send_email do
    case params[:send_for]
      when "confirmation_email"
        ContactMailer.confirmation_email(resource).deliver
      when "regular_email"
        ContactMailer.regular_email(resource).deliver
      when "activation_email"
        ContactMailer.activation_email(resource).deliver
      when "deactivation_email"
        ContactMailer.deactivation_email(resource).deliver
    end
    redirect_to admin_contact_path(resource), :notice => "#{params[:send_for].humanize} sent"
  end
  
  config.clear_sidebar_sections!
  config.clear_action_items!
  
  action_item :only => :edit do
    link_to("Back", admin_contacts_path)
  end
  action_item :only => :show do
    link_to("Back", admin_contacts_path) + link_to("Edit", edit_admin_contact_path(resource))
  end
  action_item :only => :index do
    link_to("New Contact", new_admin_contact_path)
  end
  
  index do
    
    column :name
    column :email
    column :website
    column :message
    column :message_status do |contact|
      contact.message_status == true ? "Replied" : "Unreplied"
    end
    default_actions

  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :email, :as => :email
      f.input :address
      f.input :website
      f.input :phone
      f.input :message, :as => :text, :input_html => {:rows => 8}
      f.input :message_status
    end
    f.buttons
  end
  
  show do
    panel "Contact Detail for #{contact.name}" do
      attributes_table_for contact do
        row :name
        row :email
        row :address
        row :website do 
          link_to contact.website, contact.website, :target => :_blank
        end
        row :phone
        row :message do
          contact.message.html_safe
        end
        row(:message_status) { contact.message_status ? "Replied" : "Unreplied" }
      end
    end
    
    panel "Email" do
      def build_input_and_textarea(textarea_name,submit_value,mailer_content)
        textarea :name => textarea_name,:class => :ckeditor, :rows => 10 do mailer_content end 
        br
        input :type => :submit, :value => "#{submit_value}", :onclick => "sendEmail(event,'#{textarea_name}')", :class => "send_email_button"
        br
      end
      
      mailer = Mailer.contact_mailer.first
      form :action => send_email_admin_contact_path(contact), :method => :get do |f|
        input(:type => :hidden, :value => '', :name => :send_for) 
        attributes_table_for contact do
          row(:regular_email)       { build_input_and_textarea :regular_email, "Send Regular Email", mailer.regular_email }
        end
        script :type => "text/javascript" do
          %( function sendEmail(event,sendFor) { event.target.form.send_for.value = sendFor; })
        end
      end
    end
    
  end
end
