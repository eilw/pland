class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
    @order.items.build
  end

  def show
    @order = Order.find(params.fetch(:id))
    @item = Item.new
  end

  def create
    order = current_user.orders.build(order_params)
    order.items.first.add_price_kg
    if order.save
      flash[:notice] = 'Order saved'
      redirect_to order_path(order)
    else
      flash[:notice] = 'Order not saved'
      redirect_to new_order_path
    end
  end

  def update
    order = Order.find(params.fetch(:id))
    order.update(status: params[:status]) if params[:status] 
    update_costs(order)

    redirect_to orders_path
  end

  def destroy 
    Order.find(params.fetch(:id)).destroy
    flash[:notice] = "Order deleted"

    redirect_to account_path
  end

  private

  def update_costs(order)
    order.update(cost: order.cost_total, transport_cost: order.cost_transport)
  end

  def order_params
    params.require(:order).permit(:status, :items_attributes => [ :steel_type_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :order_id])
  end
end
