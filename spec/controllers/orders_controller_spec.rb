require 'rails_helper'

describe OrdersController do
  describe '#index' do
    login_approved_user

    it 'only assigns orders with items to be shown in the view' do
      a_user = User.all.first
      order_without_item = FactoryGirl.create(:order, user: a_user)
      order_with_item = FactoryGirl.create(:order_with_items, user: a_user)

      get :index

      expect(assigns(:orders)).to eq([order_with_item])
    end
  end
end
