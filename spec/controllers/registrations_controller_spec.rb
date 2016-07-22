require 'rails_helper'

describe Users::RegistrationsController do
  describe '#create' do
    it 'sends a confirmation mail after user is created' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      FactoryGirl.create(:user, :admin)
      expect{ post :create, user: FactoryGirl.attributes_for(:user) }.to change{ ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
