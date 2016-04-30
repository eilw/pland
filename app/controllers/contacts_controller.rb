class ContactsController < ApplicationController

  def create
    @contacts = Contact.new(contact_params)
    redirect_to home_index_path
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_name, :contact_company, :contact_email, :contact_phone_num, :contact_message, :request_call)
  end
end
