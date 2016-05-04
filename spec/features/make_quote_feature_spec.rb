require 'rails_helper'
require_relative './helpers/users'

feature 'Make a quote' do
    scenario 'A user can select the steel options and see the price' do
      sign_up
      click_link('Mi cuenta')
      click_link('Crear cotización')
      select('MIG-307-Si', from: 'Tipo')
      select('Gloss', from: 'Acabado')
      fill_in('Volúmen', with: '1000')
      select('0.8', from: 'Diámetro')
      expect(page).to have_content('3.57')
    end
end
