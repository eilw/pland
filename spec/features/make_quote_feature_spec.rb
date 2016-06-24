require 'rails_helper'
require_relative './helpers/users'
require_relative './helpers/quotes'

feature 'Make a quote' do
    scenario 'A user can select the steel options and see the price' do
      sign_up
      make_quote
      expect(page).to have_content('3.12')
      expect(page).to have_content('Order saved')
      
      transport_cost = 450
      total_cost = 3570

      expect(page).to have_content("Transport: #{transport_cost}")
      expect(page).to have_content("Total cost: #{total_cost}")

      click_link('Save quote')
      expect(current_path).to eq(orders_path)
      expect(page).to have_content("Total cost: #{total_cost}")
    end
end

feature 'Request a quote' do
  scenario 'A user can submit a quote' do
    sign_up
    make_quote
    click_link('Request quote')
    expect(page).to have_content('status is: Requested')
  end
end

feature 'Delete a quote' do
  scenario 'A user can delete a quote' do
    sign_up
    make_quote
    click_link('Cancel quote')
    expect(page).to have_content('Order deleted')
    expect(current_path).to eq(account_path)
  end
end
