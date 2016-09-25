require 'rails_helper'

describe Users::RegistrationsController do
  describe '#create' do
    context 'an admin exists' do
      it 'sends a confirmation mail after user is created' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        FactoryGirl.create(:user, :admin)
        expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'an admin is not yet created' do
      it 'sends a confirmation mail after user is created' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        FactoryGirl.create(:user)
        expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change { ActionMailer::Base.deliveries.count }.by(0)
      end
    end
  end
end
