require 'rails_helper'

feature 'products' do
    scenario 'A user can access the products page and read contents' do
      visit '/'
      click_link('Productos')
      expect(current_path).to eq(products_path)
      expect(page).to have_content('Alambrón y alambre')
    end
end
