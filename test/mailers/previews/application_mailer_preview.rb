class ApplicationMailerPreview < ActionMailer::Preview
  def user_to_be_approved_email_preview
    UserMailer.request_approval_email(User.first)
  end

  def submitted_order_email_preview
    OrderMailer.submitted_order_email(Order.first)
  end
end
