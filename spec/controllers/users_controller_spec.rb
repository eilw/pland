require 'rails_helper'

describe UsersController do
  describe '#index' do
    context 'logged in as an admin' do
      login_admin

      it 'only admins can view index showing all users' do
        get :index

        expect(response).to render_template(:index)
        expect(assigns(:users)).to eq(User.all)
      end

      it 'shows users not yet approved if passed a params' do
        FactoryGirl.create(:user)
        unapproved_user = User.where(approved: false)
        get :index, approved: 'false'

        expect(response).to render_template(:index)
        expect(assigns(:users)).to eq(unapproved_user)
      end
    end

    context 'logged in as a user' do
      login_approved_user

      it 'a user is redirect to its account page' do
        get :index

        expect(response).to redirect_to(account_path)
      end
    end
  end
end
