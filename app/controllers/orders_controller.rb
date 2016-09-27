class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.reject { |order| order.items.empty? }
  end

  def show
    @quote = Quote.new
    @order = Order.find(params.fetch(:id))
  end

  def transport_choice
    @order = Order.find(params.fetch(:order).fetch(:order_id))
    @order.update(transport_type: params.fetch(:order).fetch(:transport_type))
    respond_to do |format|
      format.html { redirect_to order_path(order) }
      format.js {}
    end
  end

  def update
    order = Order.find(params.fetch(:id))
    if params[:status]
      order.update(status: params[:status])
      flash[:success] = 'Gracias por solicitar una confirmación de orden. Estaremos en contacto dentro de 48 horas para confirmar los detalles.'
    end

    redirect_to orders_path
  end

  def update_comment
    order = Order.find(params.fetch(:order).fetch(:id))
    update_costs(order)
    order.update(order_params)

    redirect_to order_path(order)
  end

  def destroy
    Order.find(params.fetch(:id)).destroy
    flash[:success] = 'Order deleted'

    redirect_to account_path
  end

  private

  def update_costs(order)
    order.update(cost: order.cost_total, transport_cost: order.cost_transport)
  end

  def order_params
    params.require(:order).permit(:status, :comment, items_attributes:
                                  [:steel_type_id, :steel_grade_id,
                                   :steel_width_id, :steel_finish_id,
                                   :cost, :volume,
                                   :price_kg, :order_id])
  end
end
