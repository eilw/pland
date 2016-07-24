class ApplicationMailerPreview < ActionMailer::Preview
  def user_to_be_approved_email_preview
    ApplicationMailer.user_to_be_approved_email(User.first)
  end
end
