require 'rails_helper'
describe OrderMailer, type: :mailer do
  describe 'submitted_order_email' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:order) { FactoryGirl.create(:order_complete_with_items, user: user) }
    let(:mail) { OrderMailer.submitted_order_email(order) }
    let(:item) { order.items.first }

    it 'sends an email to the user' do
      expect(mail.to).to eq([user.email])
    end

    it 'sends an email from the admin' do
      expect(mail.from).to eq(['pland@example.com'])
    end

    it 'contains the order details' do
      expect(mail.body.encoded).to match(item.steel_type.steel_type)
      expect(mail.body.encoded).to match(order.transport_type)
      expect(mail.body.encoded).to match(order.total_volume.to_s)
      expect(mail.body.encoded).to include('$3,570.00')
    end
  end
end
