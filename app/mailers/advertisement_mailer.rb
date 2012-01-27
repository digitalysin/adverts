class AdvertisementMailer < ActionMailer::Base
  default :from => SiteConfiguration.get_admin_email
  
  def confirmation_email(advertisement)
    initialize_variables(advertisement)
    mail :to => @advertisement.email, :subject => "Confirmation Email" do |format|
      format.text { render :text => ERB.new(@mailer.confirmation_email.to_erb).result(binding) }
    end 
  end
  
  def regular_email(advertisement)
    initialize_variables(advertisement)
    mail :to => @advertisement.email, :subject => "Confirmation Email" do |format|
      format.text { render :text => ERB.new(@mailer.regular_email.to_erb).result(binding) }
    end
  end
  
  def activation_email(advertisement)
    initialize_variables(advertisement)
    mail :to => @advertisement.email, :subject => "Confirmation Email" do |format|
      format.text { render :text => ERB.new(@mailer.activation_email.to_erb).result(binding) }
    end
  end
  
  def deactivation_email(advertisement)
    initialize_variables(advertisement)
    mail :to => @advertisement.email, :subject => "Confirmation Email" do |format|
      format.text { render :text => ERB.new(@mailer.deactivation_email.to_erb).result(binding) }
    end
  end
  
  private
    def initialize_variables(advertisement)
      @advertisement = advertisement
      if @advertisement.advertisement_type.name == "Iklan Gratis"
        @mailer = Mailer.free_advertisement_mailer.first
      else
        @mailer = Mailer.premium_advertisement_mailer.first
      end
    end
end
