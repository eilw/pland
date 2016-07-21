require 'rails_helper'
require_relative './helpers/users'

feature 'An admin can approve other users' do
  scenario 'An admin login and approves a user' do
    FactoryGirl.create(:user)
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin, scope: :user)
    visit('/')
    click_link('Mi cuenta')
    click_link('Users awaiting approval')

    expect(page).to have_content('false')

    click_link('Approve access')
    expect(page).to have_content('test@test.com approved')
    expect(page).not_to have_link('Approve access')
  end
end

feature 'A user cannot access admin info' do
  scenario 'A non-admin cannot see other users' do
    login_approved_user_factory_girl
    click_link('Mi cuenta')

    expect(page).not_to have_content('Users awaiting approval')
  end
end
