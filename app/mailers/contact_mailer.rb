class ContactMailer < ActionMailer::Base
  default :from => SiteConfiguration.get_admin_email
  
  def confirmation_email(contact)
    initialize_variables(contact)
    mail :to => @contact.email, :subject => "Confirmation Email" do |format|
      format.text { render :text => ERB.new(@mailer.confirmation_email).result(binding) }
    end 
  end
  
  def regular_email(contact)
    initialize_variables(contact)
    mail :to => @contact.email, :subject => "Email" do |format|
      format.text { render :text => ERB.new(@mailer.regular_email).result(binding) }
    end
  end
  
  def activation_email(contact)
    initialize_variables(contact)
    mail :to => @contact.email, :subject => "Activation Email" do |format|
      format.text { render :text => ERB.new(@mailer.activation_email).result(binding) }
    end
  end
  
  def deactivation_email(contact)
    initialize_variables(contact)
    mail :to => @contact.email, :subject => "Deactivation Email" do |format|
      format.text { render :text => ERB.new(@mailer.deactivation_email).result(binding) }
    end
  end
  
  private
    def initialize_variables(contact)
      @contact = contact
      @mailer = Mailer.contact_mailer.first
    end
end
