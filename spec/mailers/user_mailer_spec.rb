require 'rails_helper'
describe UserMailer, type: :mailer do
  describe 'request_approval_email' do
    let!(:admin) { FactoryGirl.create(:user, :admin) }
    let!(:new_user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.request_approval_email(new_user) }

    it 'sends an email to the admin' do
      expect(mail.to).to eq([admin.email])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(new_user.name)
    end

    it 'assigns @company' do
      expect(mail.body.encoded).to match(new_user.company)
    end
  end
end
