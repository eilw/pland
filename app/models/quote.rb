class Quote
  include ActiveModel::Model
  attr_accessor :comment, :steel_type_id, :steel_grade_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :status, :user, :order_id, :transport_type

  def save
    @order = user.orders.create!(comment: comment)
    item = @order.items.new(item_params)
    item.add_price_kg
    item.save
  end

  def add_item
    @order = Order.find(order_id)
    item = @order.items.build(item_params)
    item.add_price_kg
    item.save
  end

  def order
    @order.id
  end

  private

  def item_params
    {
      steel_type_id: steel_type_id, 
      steel_grade_id: steel_grade_id,
      steel_width_id: steel_width_id,
      steel_finish_id: steel_finish_id, 
      volume: volume,
      price_kg: price_kg
    }
  end
end
