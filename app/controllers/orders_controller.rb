class OrdersController < ApplicationController

  def new
    @account = Account.find_by_user_id(current_user.id)
    @order = Order.new
    @item = Item.new
  end

  def create
    @order.create(order_params)
  end

  def order_params
    params.require(:order).permit(:items)
  end

end
