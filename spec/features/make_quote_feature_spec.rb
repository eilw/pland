require 'rails_helper'
require_relative './helpers/users'
require_relative './helpers/quotes'
require_relative './helpers/wait_for_ajax'


feature 'Quotes' do
  feature 'Create a quote' do
    scenario 'A user can see the price per kg change according to choices', js: true do
      seed_steel_options

      login_approved_user_factory_girl
      click_link('Mi cuenta')
      click_link('Crear cotización')
      select('MIG', from: 'quote_steel_type_id')
      select('307Si', from: 'quote_steel_grade_id')
      select('0.8', from: 'quote_steel_width_id')
      select('Gloss', from: 'quote_steel_finish_id')

      expect(page).to have_content('3.12')

      select('Matt', from: 'quote_steel_finish_id')

      expect(page).to have_content('3.02')
    end

    scenario 'A user can add a new item to the order', js: true do
      login_approved_user_factory_girl
      make_quote
      add_item

      total_volume = 2000

      expect(page).to have_content("Total volume: #{total_volume}")
    end

    scenario 'A user can update the item', js: true do
      login_approved_user_factory_girl
      make_quote
      expect(page).to have_content('3.12')

      click_link('Change item')
      select('Matte', from: 'item_steel_finish_id')
      click_button('Add item to order')

      expect(page).to have_content('3.02')
    end
  end

  feature 'Save a quote' do
    scenario 'A user can select the steel options and see the price', js: true do
      login_approved_user_factory_girl
      make_quote
      transport_cost = 450
      total_cost = 3570
      total_volume = 1000

      expect(page).to have_content('3.12')
      expect(page).to have_content('Order saved')
      expect(page).to have_content("Total volume: #{total_volume}")
      expect(page).to have_content("Transport: #{transport_cost}")
      expect(page).to have_content("Total cost: #{total_cost}")

      click_link('Save quote')

      expect(current_path).to eq(orders_path)
      expect(page).to have_content("Total cost: #{total_cost}")
    end
  end

  feature 'Edit a quote' do
    scenario 'A user can edit the comment box', js: true do
      login_approved_user_factory_girl
      make_quote

      expect(page).to have_field('order_comment', with: 'My comment')

      fill_in('order_comment', with: 'Updated comment')
      click_button('Update comment')

      expect(page).to have_field('order_comment', with: 'Updated comment')
    end
  end

  feature 'Request a quote' do
    scenario 'A user can submit a quote', js: true do
      login_approved_user_factory_girl
      make_quote
      click_link('Request quote')

      expect(page).to have_content('status is: Requested')
      expect(page).to have_content('Gracias por solicitar')
    end
  end

  feature 'Delete a quote' do
    scenario 'A user can delete a quote', js: true do
      login_approved_user_factory_girl
      make_quote
      click_link('Cancel quote')

      expect(page).to have_content('Order deleted')
      expect(current_path).to eq(account_path)
    end
  end
end
