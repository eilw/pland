require 'rails_helper'
require_relative './helpers/users'
require_relative './helpers/quotes'

feature 'Quotes' do
  let(:item_cost) { '$3.12' }
  let(:updated_item_cost) { '$3.02' }

  feature 'Create a quote' do
    scenario 'A user can see the price per kg and item change according to choices', js: true do
      seed_steel_options

      login_approved_user_factory_girl
      click_link('Mi cuenta')
      click_link('Crear cotización')
      select('MIG', from: 'quote_steel_type_id')
      select('307Si', from: 'quote_steel_grade_id')
      select('0.8', from: 'quote_steel_width_id')
      expect(page).to have_content('0')
      select('Gloss', from: 'quote_steel_finish_id')

      expect(page).to have_content(item_cost)

      select('Matt', from: 'quote_steel_finish_id')

      expect(page).to have_content(updated_item_cost)

      fill_in('quote_volume', with: 1000)
      expect(page).to have_content('$3020')
    end

    scenario 'A user can add a new item to the order', js: true do
      login_approved_user_factory_girl
      make_quote
      add_item

      total_volume = 2000

      expect(page).to have_content(total_volume)
    end

    scenario 'A user can update the item', js: true do
      login_approved_user_factory_girl
      make_quote
      expect(page).to have_content(item_cost)

      find(:css, '.glyphicon-edit').click
      select('Matt', from: 'item_steel_finish_id')
      click_button('Update')

      expect(page).to have_content(updated_item_cost)
    end

    scenario 'A user can delete an item', js: true do
      login_approved_user_factory_girl
      make_quote
      expect(page).to have_content(item_cost)
      find(:css, '.glyphicon-remove').click

      expect(page).to have_content('$0.00')
    end
  end

  feature 'Save a quote' do
    scenario 'A user can select the steel options and see the price', js: true do
      login_approved_user_factory_girl
      make_quote
      transport_cost = 450
      total_cost = "3,570.00"
      total_volume = 1000

      expect(page).to have_content(item_cost)
      expect(page).to have_content(total_volume)
      expect(page).to have_content(transport_cost)
      expect(page).to have_content(total_cost)

      click_link('Save quote')

      expect(current_path).to eq(orders_path)
      expect(page).to have_content("Total cost: $#{total_cost}")
    end
  end

  feature 'Edit a quote' do
    scenario 'A user can edit the comment box', js: true do
      login_approved_user_factory_girl
      make_quote
      fill_in('order_comment', with: 'My comment')
      visit current_path

      expect(page).to have_field('order_comment', with: 'My comment')

      fill_in('order_comment', with: 'Updated comment')
      visit current_path

      expect(page).to have_field('order_comment', with: 'Updated comment')
    end
  end

  feature 'Request a quote' do
    scenario 'A user can submit a quote', js: true do
      login_approved_user_factory_girl
      make_quote
      click_link('SOLICITAR CONFIRMACIÓN')

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
