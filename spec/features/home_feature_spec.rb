require 'rails_helper'

feature 'home' do
  context 'contains information' do
    scenario 'welcomes the user' do
      visit '/'
      expect(page).to have_css('h1')
      expect(page).to have_css('h2')
    end
  end
end
