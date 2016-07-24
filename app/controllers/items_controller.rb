class ItemsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @item = Item.find(params.fetch(:id))
  end

  def update
    item = Item.find(params.fetch(:id))
    item.update(item_params)

    redirect_to order_path(item.order_id)
  end

  def item_params
    params.require(:item).permit(:steel_type_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :order_id)
  end
end
