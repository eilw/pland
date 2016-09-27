require 'rails_helper'

describe OrdersController do
  describe '#index' do
    it 'only assigns orders with items to be shown in the view' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      a_user = FactoryGirl.create(:user, :approved)
      sign_in :user, a_user
      order_without_item = FactoryGirl.create(:order, user: a_user)
      order_with_item = FactoryGirl.create(:order_with_items, user: a_user)

      get :index

      expect(assigns(:orders)).to eq([order_with_item])
    end
  end
end
