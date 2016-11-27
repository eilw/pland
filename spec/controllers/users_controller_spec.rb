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

    describe '#update' do
      login_admin
      it 'when a user is approved, it sends an email to the user' do
        user_to_be_approved = FactoryGirl.create(:user)

        expect { put :update, id: user_to_be_approved }.to change { ActionMailer::Base.deliveries.count }.by(1)
        expect(flash[:success]).not_to be_empty
      end

      it 'does not go through approve actions if user is already approved' do
        approved_user = FactoryGirl.create(:user, :approved)

        expect { put :update, id: approved_user }.to change { ActionMailer::Base.deliveries.count }.by(0)
      end
    end
  end
end
