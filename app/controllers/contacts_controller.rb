class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    ContactMailer.send_form_info(@contact).deliver_now
    redirect_to home_index_path, notice: "Thankyou for your message."
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_name, :contact_company, :contact_email, :contact_phone_num, :contact_message, :request_call)
  end
end
