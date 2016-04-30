class ContactMailer < ApplicationMailer
  default from: "from@pland.com"

  def send_form_info(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Sample Email', body: 'Another test')
  end
end
