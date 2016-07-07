require 'rails_helper'
require_relative './helpers/users'

feature 'sign up' do
    scenario 'A user gets a greetings message after signed up a new account' do
      sign_up
      expect(page).to have_content('Gracias por crear una cuenta')
    end
end
