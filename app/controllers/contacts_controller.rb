class ContactsController < ApplicationController
  before_filter :initialize_variables
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new params[:contact]
    respond_to do |format|
      if @contact.save
        ContactMailer.confirmation_email(@contact).deliver
        format.html do redirect_to contacts_url, :notice => "pesan anda kami terima dan akan segera kami proses" end
      else
        format.html do render :action => "index" end
      end
    end
  end
  private
    def initialize_variables
      @current_page = "contact"
      @contact_page = Page.find_by_model_for :contact
    end
end
