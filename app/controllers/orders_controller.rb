class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @quote = Quote.new
    @order = Order.find(params.fetch(:id))
  end

  def transport_choice
    @order = Order.find(params.fetch(:id))
    @order.update(transport_type: params.fetch(:order).fetch(:transport_type))
  end

  def print_label
    @order = Order.find(params.fetch(:id))
    @order.update(print_label: params.fetch(:order).fetch(:print_label))

    redirect_to order_path(@order)
  end

  def submit
    @order = Order.find(params.fetch(:id))
    if @order.complete?
      @order.update(status: 'Submitted')
      update_costs(@order)
      OrderMailer.submitted_order_email(@order).deliver_now

      redirect_to quote_confirmation_path
    else
      flash[:warning] = 'An order needs to be 1000kg of volume minimum'

      redirect_to order_path(@order)
    end
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
