class BannerMailer < ActionMailer::Base
  default :from => SiteConfiguration.get_admin_email
  
  def confirmation_email(banner)
    initialize_variables(banner)
    mail :to => @banner.email, :subject => "Confirmation Email" do |format|
      format.text { render :text => ERB.new(@mailer.confirmation_email).result(binding) }
    end 
  end
  
  def regular_email(banner)
    initialize_variables(banner)
    mail :to => @banner.email, :subject => "Email" do |format|
      format.text { render :text => ERB.new(@mailer.regular_email).result(binding) }
    end
  end
  
  def activation_email(banner)
    initialize_variables(banner)
    mail :to => @banner.email, :subject => "Activation Email" do |format|
      format.text { render :text => ERB.new(@mailer.activation_email).result(binding) }
    end
  end
  
  def deactivation_email(banner)
    initialize_variables(banner)
    mail :to => @banner.email, :subject => "Deactivation Email" do |format|
      format.text { render :text => ERB.new(@mailer.deactivation_email).result(binding) }
    end
  end
  
  private
    def initialize_variables(banner)
      @banner = banner
      @mailer = Mailer.banner_mailer.first
    end
end
