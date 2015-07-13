class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      flash[:info] = 'Message sent successfully!'
      redirect_to new_contact_path
    else
      flash[:danger] = 'Error occurred, please try again.'
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
      
    end
end