require 'rails_helper'
require_relative './helpers/users'
require_relative './helpers/quotes'

feature 'Edit an order' do
  scenario 'A user can edit an individual item' do
    sign_up
    make_quote
    click_link('Change item')
    expect(page).to have_content('MIG-307Si') # '0.8', 'Gloss', '1000')
  end
end


