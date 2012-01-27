class LinkMailer < ActionMailer::Base
  default :from => SiteConfiguration.get_admin_email
  
  def confirmation_email(link)
    initialize_variables(link)
    mail :to => @link.email, :subject => "Confirmation Email" do |format|
      format.text { render :text => ERB.new(@mailer.confirmation_email).result(binding) }
    end 
  end
  
  def regular_email(link)
    initialize_variables(link)
    mail :to => @link.email, :subject => "Email" do |format|
      format.text { render :text => ERB.new(@mailer.regular_email).result(binding) }
    end
  end
  
  def activation_email(link)
    initialize_variables(link)
    mail :to => @link.email, :subject => "Activation Email" do |format|
      format.text { render :text => ERB.new(@mailer.activation_email).result(binding) }
    end
  end
  
  def deactivation_email(link)
    initialize_variables(link)
    mail :to => @link.email, :subject => "Deactivation Email" do |format|
      format.text { render :text => ERB.new(@mailer.deactivation_email).result(binding) }
    end
  end
  
  private
    def initialize_variables(link)
      @link = link
      @mailer = Mailer.link_mailer.first
    end
end
