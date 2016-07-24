require 'rails_helper'

feature 'About us' do
    scenario 'A user can access the about us page and read contents' do
      visit '/'
      click_link('Sobre nosotros')
      expect(current_path).to eq(about_index_path)
      expect(page).to have_content('Desde 2011, somos los representantes')
    end
end
