def make_quote(steel_type: 'MIG-307Si', steel_width: '0.8', steel_finish: 'Gloss', volume: '1000')
  click_link('Mi cuenta')
  click_link('Crear cotización')
  select(steel_type, from: 'order_items_attributes_0_steel_type_id')
  select(steel_width, from: 'order_items_attributes_0_steel_width_id')
  select(steel_finish, from: 'order_items_attributes_0_steel_finish_id')
  fill_in('order_items_attributes_0_volume', with: volume)
  click_button('Add item to order')
end
