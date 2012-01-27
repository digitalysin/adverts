ActiveAdmin.register Link do
  member_action :send_email do
    case params[:send_for]
      when "confirmation_email"
      when "regular_email"
      when "activation_email"
      when "deactivation_email"
    end
    redirect_to admin_link_path(resource), :notice => "#{params[:send_for].humanize} sent"
  end
  
  config.clear_sidebar_sections!
  
  index do
    column :name
    column :email
    column :website
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :website
      f.input :link_price, :include_blank => false
      f.input :enabled
    end
    f.buttons
  end
  
  show do
    panel "Link detail" do
      attributes_table_for resource do
        row :name
        row :email
        row :phone
        row :website
        row :valid_until do resource.created_at + (resource.link_price.id * 30).days end
        row :enabled do resource.enabled.present? ? "Yes" : "No" end
      end
    end
    
    panel "Email" do
      def build_input_and_textarea(textarea_name,submit_value,mailer_content)
        textarea :name => textarea_name,:class => :ckeditor, :rows => 10 do mailer_content end 
        br
        input :type => :submit, :value => "#{submit_value}", :onclick => "sendEmail(event,'#{textarea_name}')", :class => "send_email_button"
        br
      end
      
      mailer = Mailer.link_mailer.first
      form :action => send_email_admin_link_path(resource), :method => :get do |f|
        input(:type => :hidden, :value => '', :name => :send_for) 
        attributes_table_for resource do
          row(:confirmation_email)  { build_input_and_textarea :confirmation_email, "Send Confirmation Email", mailer.confirmation_email }
          row(:regular_email)       { build_input_and_textarea :regular_email, "Send Regular Email", mailer.regular_email }
          row(:activation_email)    { build_input_and_textarea :activation_email, "Send Activation Email", mailer.activation_email } 
          row(:deactivation_email)  { build_input_and_textarea :deactivation_email, "Send Deactivation Email", mailer.deactivation_email }
        end
        script :type => "text/javascript" do
          %( function sendEmail(event,sendFor) { event.target.form.send_for.value = sendFor; })
        end
      end
    end
  end
end