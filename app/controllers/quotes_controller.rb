class QuotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @quote = Quote.new()
  end

  def create
    quote = Quote.new(quote_params)
    if quote.save
      flash[:notice] = 'Order saved'
      redirect_to order_path(quote.order)
    else
      flash[:notice] = 'Order not saved'
      redirect_to new_quote_path
    end
  end

  def add_item
    quote = Quote.new(quote_params)
    if quote.add_item
      flash[:notice] = 'Item added'
    else
      flash[:notice] = 'Item not saved'
    end
    redirect_to order_path(quote.order)
  end
  
  def price
    steel_values = (params.fetch(:quote, nil) || params.fetch(:item, nil)).clone
    price_kg = Item.price_kg(steel_values)
    render json: {new_price_kg: price_kg}
  end

  private 
  def quote_params
    params.require(:quote).permit(:status, :comment, :steel_type_id, :steel_grade_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :user, :order_id).merge(user: current_user)
  end
end
