class OrdersController < ApplicationController

  def new
    @order = Order.new
    @item = Item.new
  end

  def create
    @account = Account.find_by_user_id(current_user.id)
    Order.create(order_params)
    #redirect_to account_path(@account)
  end

  def order_params
    params.require(:order).permit(:items)
  end

end
