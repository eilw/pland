require 'rails_helper'
require_relative './helpers/users'
require_relative './helpers/quotes'

feature 'Edit an order' do
  scenario 'A user can edit an individual item' do
    login_approved_user_factory_girl
    make_quote
    click_link('Change item')
    expect(page).to have_content('MIG-307Si')
  end
end
