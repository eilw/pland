class UserMailer < ApplicationMailer
  default from: "pland@example.com"

  def request_approval_email(user)
    @admin = User.where(admin: true).first
    @user = user
    mail(to: @admin.email, subject: 'New user on Purple land') if @admin
  end
end
