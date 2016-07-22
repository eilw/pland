class ContactFormMailer < ApplicationMailer
  default from: "pland@example.com"

  def send_form_info_email(contact)
    admin = User.where(admin: true).first
    @contact = contact
    mail(to: admin.email, subject: 'New contact inquiry from purple land received')
  end
end
