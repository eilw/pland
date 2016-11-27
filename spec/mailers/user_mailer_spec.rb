require 'rails_helper'
describe UserMailer, type: :mailer do
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:user) { FactoryGirl.create(:user) }

  describe 'request_approval_email' do
    let(:mail) { UserMailer.request_approval_email(user) }

    it 'sends an email to the admin' do
      expect(mail.to).to eq([admin.email])
    end

    it 'assigns @name and @company' do
      expect(mail.body.encoded).to match(user.name)
      expect(mail.body.encoded).to match(user.company)
    end
  end

  describe 'approved_user_email' do
    let(:mail) { UserMailer.approved_user_email(user) }

    it 'sends an email to the user' do
      expect(mail.to).to eq([user.email])
    end
  end
end
