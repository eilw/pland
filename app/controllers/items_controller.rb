class ItemsController < ApplicationController
  def new
    @item = Item.new
    @order = Order.find(params[:order_id])
  end

  def create
    item = Item.new(item_params)
    item.order_id = params[:order_id]
    item.price_kg = calculate_price(item)
    if item.save
      flash[:notice] = 'Item saved'
      redirect_to order_path(params[:order_id])
    else
      flash[:notice] = 'Item not saved'
      redirect_to new_item_path
    end
  end

  def calculate_price(item)
    cost_type = SteelType.find(item.steel_type.id).cost
    cost_width = SteelWidth.find(item.steel_width.id).cost
    cost_finish = SteelFinish.find(item.steel_finish_id).cost
    cost_type + cost_width + cost_finish
  end

  def item_params
    params.require(:item).permit(:steel_type_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :order_id)
  end
end
