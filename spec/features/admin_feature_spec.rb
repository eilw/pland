require 'rails_helper'
require_relative './helpers/users'

feature 'Admin' do
  feature 'An admin can approve other users' do
    scenario 'An admin login and approves a user' do
      admin = FactoryGirl.create(:user, :admin)
      FactoryGirl.create(:user)
      login_as(admin, scope: :user)
      visit('/')
      click_link('MI CUENTA')

      expect(page).to have_content('false')

      click_link('Approve access')
      expect(page).to have_content('test@test.com approved')
      expect(page).not_to have_link('Approve access')
    end

    scenario 'A non-admin cannot see mi cuenta link' do
      login_approved_user_factory_girl

      expect(page).not_to have_content('MI CUENTA')
    end
  end
end
