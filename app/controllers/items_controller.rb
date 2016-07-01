class ItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @item = Item.new
    @order = Order.find(params.fetch(:order_id))
  end

  def edit
    @item = Item.find(params.fetch(:id))
  end

  def update
    item = Item.find(params.fetch(:id))
    item.update(item_params)

    redirect_to order_path(item.order_id)
  end

  def create
    order = Order.find(params.fetch(:order_id))
    item = order.items.build(item_params)
    item.add_price_kg 
    if item.save
      flash[:notice] = 'Item saved'

      redirect_to order_path(order)
    else
      flash[:notice] = 'Item not saved'

      redirect_to new_item_path
    end
  end

  def item_params
    params.require(:item).permit(:steel_type_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :order_id)
  end
end
