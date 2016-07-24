def make_quote(steel_type: 'MIG-307Si', steel_width: '0.8', steel_finish: 'Gloss', volume: '1000', comment: 'My comment')
  seed_steel_options
  click_link('Mi cuenta')
  click_link('Crear cotización')
  select(steel_type, from: 'quote_steel_type_id')
  select(steel_width, from: 'quote_steel_width_id')
  select(steel_finish, from: 'quote_steel_finish_id')
  fill_in('quote_volume', with: volume)
  fill_in('quote_comment', with: comment)
  click_button('Add item to order')
end

def seed_steel_options
  Rails.application.load_seed
end
