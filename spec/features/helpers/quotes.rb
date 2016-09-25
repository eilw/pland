def make_quote(steel_type: 'MIG', steel_grade: '307Si', steel_width: '0.8', steel_finish: 'Gloss', volume: '1000')
  seed_steel_options
  click_link('Mi cuenta')
  click_link('Crear cotización')
  select(steel_type, from: 'quote_steel_type_id')
  select(steel_grade, from: 'quote_steel_grade_id')
  select(steel_width, from: 'quote_steel_width_id')
  select(steel_finish, from: 'quote_steel_finish_id')
  fill_in('quote_volume', with: volume)
  click_button('Add to order')

  select('CIF', from: 'order_transport_type')
end

def seed_steel_options
  Rails.application.load_seed
end

def add_item(steel_type: 'MIG', steel_grade: '307Si', steel_width: '0.8', steel_finish: 'Gloss', volume: '1000')
  select(steel_type, from: 'quote_steel_type_id')
  select(steel_grade, from: 'quote_steel_grade_id')
  select(steel_width, from: 'quote_steel_width_id')
  select(steel_finish, from: 'quote_steel_finish_id')
  fill_in('quote_volume', with: volume)
  click_button('Add to order')
end
