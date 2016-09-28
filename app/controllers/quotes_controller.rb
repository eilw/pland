class QuotesController < ApplicationController
  before_action :authenticate_user!

  def new
    redirect_to order_path(current_user.orders.create)
  end

  def add_item
    quote = Quote.new(quote_params)
    if quote.add_item
      flash[:success] = 'Item added'
    else
      flash[:error] = 'Item not saved'
    end
    redirect_to order_path(quote.order)
  end

  def price
    steel_values = (params.fetch(:quote, nil) || params.fetch(:item, nil)).clone
    calculator = PriceCalculator.new(steel_values)

    render json: { new_price_kg: calculator.price_kg, new_item_cost: calculator.cost_item }
  end

  private

  def quote_params
    params.require(:quote)
          .permit(:status, :comment, :steel_type_id, :steel_grade_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :user, :order_id)
          .merge(user: current_user)
  end
end
