class ContactMailer < ApplicationMailer
  default from: "postmaster@app20dd2f3882a64b45a3b2ca127290544e.mailgun.org"

  def send_form_info(contact)
    @contact = contact
    p @contact
    mail(to: @contact.email, subject: 'Sample Email', body: 'Another test')
  end
end
