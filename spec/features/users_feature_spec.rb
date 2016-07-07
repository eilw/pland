require 'rails_helper'
require_relative './helpers/users'

feature "User can sign in and out" do
  context "user not logged in and on the homepage" do
    scenario "should see a 'Log in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not see 'Log out' link" do
      visit('/')
      expect(page).not_to have_link('Log out')
    end
  end

  context "user logged in on the homepage" do
    scenario "should see 'Log out' link" do
      sign_up
      visit('/')
      expect(page).to have_link('Log out')
    end

    scenario "should not see a 'Log in' link and a 'sign up' link" do
      sign_up
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end

    xscenario 'A user gets a greetings message after signed up a new account' do
      sign_up
      expect(page).to have_content('Gracias por crear una cuenta')
    end
  end
end
