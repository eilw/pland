require 'rails_helper'

feature 'contact form' do
    scenario 'A user can send in a request to be contacted' do
      visit '/'
      fill_in('contact_name',with: 'test')
      fill_in('contact_company', with: 'TestCo')
      fill_in('contact_email', with: 'test@example.com')
      fill_in('contact_phone_num', with: '012345678')
      fill_in('contact_message', with: 'My message to you')
      check('request_call')
      click_button('Submit')
      expect(page).to have_content('Gracias por su mensaje')
    end
end
