class ContactsController < ApplicationController

  def create
    p contact_params
    @contact = Contact.new(contact_params)

    ContactMailer.send_form_info(@contact).deliver_now
    redirect_to home_index_path, notice: "Thankyou for your message."
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company, :email, :phone_num, :message, :request_call)
  end
end
