ActiveAdmin.register Banner do
  
  member_action :send_email do
    case params[:send_for]
      when "confirmation_email"
        BannerMailer.confirmation_email(resource).deliver
      when "regular_email"
        BannerMailer.regular_email(resource).deliver
      when "activation_email"
        BannerMailer.activation_email(resource).deliver
      when "deactivation_email"
        BannerMailer.deactivation_email(resource).deliver
    end
    redirect_to admin_banner_path(resource), :notice => "#{params[:send_for].humanize} sent"
  end
  
  def create_how_long
    how_long = {}
    (1..12).to_a.each { |e| how_long["#{e} x Bulan"] = e }
    how_long
  end
  
  index do
    column :name
    column :email
    column :phone
    default_actions
  end
  
  show do
    panel "Banner Detail" do
      attributes_table_for banner do
        row :name
        row :email
        row :phone
        row :banner_category do link_to banner.banner_category.name, admin_banner_category_path(banner.banner_category) end
        row :how_long do span "#{banner.how_long} x 30 hari" end 
        row :price do 
            number_to_currency(banner.banner_category.price * banner.how_long, :unit => "Rp")
        end
        row :valid_until do
          banner.created_at + (banner.how_long * 30).days
        end
        row :site do link_to banner.site, banner.site, :target => :_blank end
        row :content do banner.content.html_safe end
        row :enabled do banner.enabled.present? ? "Yes" : "No" end
        row :image do image_tag banner.image_url(:thumb) if banner.image.present? end
      end
    end
    
    panel "Email" do
      def build_input_and_textarea(textarea_name,submit_value,mailer_content)
        textarea :name => textarea_name,:class => :ckeditor, :rows => 10 do mailer_content end 
        br
        input :type => :submit, :value => "#{submit_value}", :onclick => "sendEmail(event,'#{textarea_name}')", :class => "send_email_button"
        br
      end
      
      mailer = Mailer.banner_mailer.first
      form :action => send_email_admin_banner_path(resource), :method => :get do |f|
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
  
  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :name
      f.input :email, :as => :email
      f.input :phone
      f.input :banner_category, :include_blank => false
      f.input :how_long, :as => :select, :include_blank => false, :collection => create_how_long
      f.input :content , :as => :text, :input_html => {:rows => 7}
      f.input :site
      f.input :image, :as => :file
      f.input :enabled
    end
    f.buttons
  end
end
