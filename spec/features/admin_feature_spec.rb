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
      click_link('Manage Users')

      expect(page).to have_content('User management')

      click_link('Approve access')
      expect(page).to have_content('test@test.com approved')
      expect(page).not_to have_link('Approve access')
    end

    scenario 'A non-admin cannot see mi cuenta link' do
      login_approved_user_factory_girl

      expect(page).not_to have_content('MI CUENTA')
    end
  end

  feature 'Rails admin site' do
    scenario 'An admin can access it' do
      admin = FactoryGirl.create(:user, :admin)
      login_as(admin, scope: :user)
      visit('/')
      click_link('MI CUENTA')
      click_link('Manage database')
      expect(page).to have_content('Site Administration')
    end

    scenario 'A approved user cannot access it' do
      approved = FactoryGirl.create(:user, :approved)
      login_as(approved, scope: :user)
      visit('/')
      visit(rails_admin_path)
      expect(current_path).to eq(root_path)
    end

    scenario 'a guest will be redirected to login' do
      visit(rails_admin_path)
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
