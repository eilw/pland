require 'rails_helper'

describe Users::RegistrationsController do
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end
  describe '#create' do
    it 'redirects a new user to the welcome screen' do
      post :create, user: user_params

      user = User.all.first
      expect(response).to redirect_to(welcome_user_path(user))
    end

    context 'sending out confirmation email' do
      context 'an admin exists' do
        it 'sends a confirmation mail after user is created' do
          FactoryGirl.create(:user, :admin)
          expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change { ActionMailer::Base.deliveries.count }.by(1)
        end
      end

      context 'an admin is not yet created' do
        it 'does not send a confirmation mail after user is created' do
          expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change { ActionMailer::Base.deliveries.count }.by(0)
        end
      end
    end
  end

  def user_params
    {
      name: 'Name',
      company: 'Empresa',
      country: 'Pais',
      phone_num: '12345678',
      email: 'test@test.com',
      password: '123456'
    }
  end
end
