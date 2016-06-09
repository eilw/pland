class OrdersController < ApplicationController

  def new
    @order = Order.new
    @item = Item.new
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end

  def create
    order = Order.new(order_params)
    if order.save
      flash[:notice] = 'Order saved'
      redirect_to order_path(order)
    else
      flash[:notice] = 'Order not saved'
      redirect_to new_order_path
    end
  end

  def order_params
    params.require(:order).permit(:items)
  end

end
