ActiveAdmin.register Advertisement do
  
  member_action :send_email do
    case params[:send_for]
      when "confirmation_email" 
        AdvertisementMailer.confirmation_email(resource).deliver
      when "regular_email" 
        AdvertisementMailer.regular_email(resource).deliver 
      when "activation_email" 
        AdvertisementMailer.activation_email(resource).deliver 
      when "deactivation_email" 
        AdvertisementMailer.deactivation_email(resource).deliver 
    end
    redirect_to admin_advertisement_path(resource), :notice => "#{params[:send_for].humanize} sent"
  end
  
  index do
    column :name
    column :email
    column :site do |advertisement|
      link_to advertisement.site , advertisement.site, :target => :_blank
    end
    default_actions
  end
  
  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :name
      f.input :email, :as => :email
      f.input :city
      f.input :phone, :as => :phone
      f.input :title
      f.input :site
      f.input :content, :as => :text, :input_html => {:rows => 7, :class => :ckeditor}
      f.input :tag
      f.input :image, :as => :file
      f.input :enabled
      f.input :advertisement_category, :include_blank => false
      f.input :advertisement_type, :include_blank => false
      f.input :advertisement_price, :include_blank => false
    end
    f.buttons
  end
  
  show do
    panel "Advertisement Detail" do
      attributes_table_for advertisement do
        row :name
        row :email
        row :city
        row :phone
        row :advertisement_category
        row :advertisement_price do 
          number_to_currency(advertisement.advertisement_price.price, :unit => "Rp.")  
        end if advertisement.advertisement_type.name == "Iklan Premium"
        row :valid_until do 
          advertisement.created_at + (advertisement.advertisement_price.id * 30).days
        end if advertisement.advertisement_type.name == "Iklan Premium"
        row :advertisement_type
        row :title 
        row :site do link_to advertisement.site, advertisement.site, :target => :_blank end
        row :content do advertisement.content.html_safe end
        row :tag 
        row :enabled do advertisement.enabled.present? ? "Yes" : "No" end
        row :image do image_tag advertisement.image_url(:thumb) end
      end
    end
    
    panel "Email" do
      def build_input_and_textarea(textarea_name,submit_value,mailer_content)
        textarea :name => textarea_name,:class => :ckeditor, :rows => 10 do mailer_content end 
        br
        input :type => :submit, :value => "#{submit_value}", :onclick => "sendEmail(event,'#{textarea_name}')", :class => "send_email_button"
        br
      end
      
      if advertisement.advertisement_type.name == "Iklan Gratis"
        mailer = Mailer.free_advertisement_mailer.first
      else
        mailer = Mailer.premium_advertisement_mailer.first
      end
      form :action => send_email_admin_advertisement_path(advertisement), :method => :get do |f|
        input(:type => :hidden, :value => '', :name => :send_for) 
        attributes_table_for advertisement do
          row(:confirmation_email)  { build_input_and_textarea :confirmation_email, "Send Confirmation Email", mailer.confirmation_email }
          row(:regular_email)       { build_input_and_textarea :regular_email, "Send Regular Email", mailer.regular_email }
          row(:activation_email)    { build_input_and_textarea :activation_email, "Send Activation Email", mailer.activation_email } 
          row(:deactivation_email)  { build_input_and_textarea :deactivation_email, "Send Deactivation Email", mailer.deactivation_email }
        end
        script(:type => "text/javascript") { %( function sendEmail(event,sendFor) { event.target.form.send_for.value = sendFor; }) }
      end
    end
  end
end
