class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    ContactMailer.send_form_info(@contact).deliver_now
    flash[:notice] = "Gracias por su mensaje – estaremos en contacto dentro de 48 horas."
    redirect_to home_index_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company, :email, :phone_num, :message, :request_call)
  end
end
