require 'rails_helper'

describe OrdersController do
  login_approved_user
  let(:a_user) { User.all.first }
  let!(:order_with_item) { FactoryGirl.create(:order_with_items, user: a_user) }
  let!(:incomplete_order) { FactoryGirl.create(:order, user: a_user) }

  describe '#index' do
    it 'only assigns orders with items to be shown in the view' do
      order_without_item = FactoryGirl.create(:order, user: a_user)

      get :index

      expect(assigns(:orders)).to eq([order_with_item])
    end
  end

  describe '#print_label' do
    let(:order) { FactoryGirl.create(:order, user: a_user) }

    it 'updates the order print_label attribute' do
      post :print_label, id: order, order: { print_label: '1' }
      order.reload

      expect(order.print_label).to eq(true)
    end

    it 'returns to the order form' do
      post :print_label, id: order, order: { print_label: '1' }

      expect(response).to redirect_to(order_path(order))
    end
  end

  describe '#submit' do
    before { FactoryGirl.create(:user, :admin) }

    it 'sends an email to the user after the order has been submitted' do
      expect { post :submit, id: order_with_item }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'returns a warning if the order is not complete' do
      post :submit, id: incomplete_order

      expect(response).to redirect_to(order_path(incomplete_order))
      expect(flash[:warning]).not_to be_empty
    end
  end
end
