class UserMailerPreview < ActionMailer::Preview
  def request_approval_email
    admin = User.where(admin: true).first || FactoryGirl.create(:user, :admin)
    UserMailer.request_approval_email(admin)
  end

  def approved_user_email
    user = User.where(approved: false).first || FactoryGirl.create(:user)
    UserMailer.approved_user_email(user)
  end
end
