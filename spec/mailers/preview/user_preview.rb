class UserMailerPreview < ActionMailer::Preview
  def request_approval_email
    admin = User.where(admin: true).first || FactoryGirl.create(:user, :admin)
    UserMailer.request_approval_email(admin)
  end
end
