require 'rails_helper'

feature 'Contact us' do
  scenario 'A user can access the contact us page' do
    visit '/'
    click_link('CONTACTO')
    expect(current_path).to eq(contacts_path)
  end
end
