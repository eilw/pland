require 'rails_helper'
require_relative './helpers/users'

feature "User can sign in and out" do
  context "user not logged in and on the homepage" do
    scenario "should see a 'Iniciar sesión' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Iniciar sesión')
      expect(page).to have_link('Registrarse')
    end

    scenario "should not see 'Salir' link" do
      visit('/')
      expect(page).not_to have_link('Salir')
    end
  end

  context 'signing up' do
    # Need an admin for approval email to be sent to
    before { FactoryGirl.create(:user, :admin) }

    scenario 'A user does not get access until approved by admin' do
      sign_up

      expect(page).to have_content('Welcome')

      click_link('Iniciar sesión')

      fill_in('user_email', with: 'test@example.com')
      fill_in('user_password', with: 'testtest')
      click_button('Iniciar sesión')

      expect(page).to have_content('Que se haya registrado con éxito, pero su cuenta no ha sido aprobado por el administrador todavía.')
    end
  end

  context 'user logged in on the homepage' do
    scenario "should see 'Salir' link" do
      login_approved_user_factory_girl
      visit('/')
      expect(page).to have_link('Salir')
    end

    scenario "should not see a 'Iniciar sesión' link and a 'sign up' link" do
      login_approved_user_factory_girl
      expect(page).not_to have_link('Iniciar sesión')
      expect(page).not_to have_link('Registrarse')
    end

    xscenario 'A user gets a greetings message after signed up a new account' do
      sign_up
      expect(page).to have_content('Gracias por crear una cuenta')
    end
  end
end
