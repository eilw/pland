require 'rails_helper'
require_relative './helpers/users'
require_relative './helpers/quotes'
require_relative './helpers/wait_for_ajax'

feature 'Quotes' do
  let(:item_cost) { '$3.12' }
  let(:updated_item_cost) { '$3.02' }

  feature 'Create a quote' do
    scenario 'A user can see the price per kg and item change according to choices', js: true do
      seed_steel_options

      login_approved_user_factory_girl
      click_link(I18n.t('layouts.application.nav_bar.create_quote'))
      select('MIG', from: 'quote_steel_type_id')
      select('307Si', from: 'quote_steel_grade_id')
      select('0.8', from: 'quote_steel_width_id')
      expect(page).to have_content('0')
      select('Brillante', from: 'quote_steel_finish_id')

      expect(page).to have_content(item_cost)

      select('Mate', from: 'quote_steel_finish_id')

      expect(page).to have_content(updated_item_cost)

      fill_in('quote_volume', with: 1000)
      expect(page).to have_content('$3020')
    end

    scenario 'A user can see the order details', js: true do
      login_approved_user_factory_girl
      make_quote
      transport_cost_per_kg = 0.45
      transport_cost = 450
      total_cost = '3,570.00'
      total_volume = 1000

      expect(page).to have_content(item_cost)
      expect(page).to have_content(total_volume)
      expect(page).to have_content(transport_cost)
      expect(page).to have_content(transport_cost_per_kg)
      expect(page).to have_content(total_cost)
    end

    scenario 'A user can add a new item to the order', js: true do
      login_approved_user_factory_girl
      make_quote
      add_item

      total_volume = 2000

      expect(page).to have_content(total_volume)
    end

    scenario 'A user can only submit once the order is valid', js: true do
      login_approved_user_factory_girl
      make_quote(volume: 900)

      expect(page).to have_selector('button', 'submit-order.disabled')

      add_item(volume: 100)
      expect(page).to have_link('SOLICITAR CONFIRMACIÓN')
    end

    scenario 'A user can add they are interested in information about marking', js: true do
      login_approved_user_factory_girl
      make_quote
      check('print_label')

      expect(page.has_checked_field?('print_label')).to eq(true)
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

    scenario 'A user can update an item', js: true do
      login_approved_user_factory_girl
      make_quote
      expect(page).to have_content(item_cost)

      find(:css, '.glyphicon-edit').click
      select('Mate', from: 'item_steel_finish_id')
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

    scenario 'A user can change the transport options', js: true do
      login_approved_user_factory_girl
      make_quote
      total_cost_with_cif = '3,570.00'
      total_cost_with_fob = '$3,370.00'
      expect(page).to have_content(total_cost_with_cif)

      select('FOB', from: 'order_transport_type')

      wait_for_ajax

      updated_cost = find('#total_cost').text

      expect(updated_cost).to eq(total_cost_with_fob)
    end
  end

  feature 'Request a quote' do
    scenario 'A user can submit a quote only if it is complete', js: true do
      login_approved_user_factory_girl
      make_quote(transport_type: 'Seleccione una opción')

      wait_for_ajax

      expect(page).to have_button('SOLICITAR CONFIRMACIÓN')

      select('FOB', from: 'order_transport_type')

      wait_for_ajax
      click_link('SOLICITAR CONFIRMACIÓN')

      expect(current_path).to eq(quote_confirmation_path)
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
