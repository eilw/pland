class ContactMailer < ApplicationMailer
  default from: "from@pland.com"


  def contact_form_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
