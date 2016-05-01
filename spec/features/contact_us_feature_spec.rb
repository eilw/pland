require 'rails_helper'

feature 'contact us' do
    scenario 'A user can access the contact us page' do
      visit '/'
      click_link('Contacto')
      expect(current_path).to eq(contacts_path)
    end
end
