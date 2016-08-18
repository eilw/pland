class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @quote = Quote.new()
    @order = Order.find(params.fetch(:id))
  end

  def update
    order = Order.find(params.fetch(:id))
    update_costs(order)
    if params[:order]
      order.update(order_params)
      redirect_to order_path(order)
    elsif params[:status]
      order.update(status: params[:status])
      flash[:notice] = 'Gracias por solicitar una confirmación de orden. Estaremos en contacto dentro de 48 horas para confirmar los detalles.'

      redirect_to orders_path
    else
      redirect_to orders_path
    end
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
    params.require(:order).permit(:status, :comment, :items_attributes => [ :steel_type_id, :steel_grade_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :order_id])
  end
end
