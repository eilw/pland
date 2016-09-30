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
    @order = Order.find(params.fetch(:id))
    @order.update(transport_type: params.fetch(:order).fetch(:transport_type))
    respond_to do |format|
      format.html { redirect_to order_path(order) }
      format.js {}
    end
  end

  def submit
    order = Order.find(params.fetch(:id))
    if order.complete?
      order.update(status: 'Submitted')
      update_costs(order)
      flash[:success] = 'Gracias por solicitar una confirmación de orden. Estaremos en contacto dentro de 48 horas para confirmar los detalles.'

      redirect_to orders_path
    else
      flash[:warning] = 'An order needs to be 1000kg of volume minimum'

      redirect_to order_path(order)
    end
  end

  def save
    order = Order.find(params.fetch(:id))
    order.update(status: 'Saved')
    flash[:success] = 'Order was saved'

    redirect_to orders_path
  end

  def update_comment
    order = Order.find(params.fetch(:id))
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
    params.require(:order).permit(:status, :comment)
  end
end
