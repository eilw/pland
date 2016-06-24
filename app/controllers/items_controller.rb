class ItemsController < ApplicationController
  def new
    @item = Item.new
    @order = Order.find(params[:order_id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    redirect_to order_path(item.order_id)
  end

  def create
    order = Order.find(params[:order_id])
    item = order.items.build(item_params)
    item.price_kg = item.calculate_price
    if item.save
      flash[:notice] = 'Item saved'
      redirect_to order_path(params[:order_id])
    else
      flash[:notice] = 'Item not saved'
      redirect_to new_item_path
    end
  end


  def item_params
    params.require(:item).permit(:steel_type_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :order_id)
  end
end
