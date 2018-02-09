class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    #Rails.logger.debug 'DEBUG: entering create'
    @contact = Contact.new(secure_params)
    if @contact.valid?
      Rails.logger.debug 'DEBUG: contact valid, attempting to send email'
      UserMailer.contact_email(@contact).deliver_now
      flash[:notice] = "Message sent from #{@contact.name}"
      redirect_to root_path
    else
      Rails.logger.debug 'DEBUG: contact not valid'
      flash[:alert] = "Missing Name, Email or Message."
      render :new
    end
  end

  private
  def secure_params
    Rails.logger.debug 'DEBUG: entering secure_params'
    params.require(:contact).permit(:name, :email, :content)
  end

end
