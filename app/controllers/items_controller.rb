class ItemsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @item = Item.find(params.fetch(:id))
  end

  def destroy
    item = Item.find(params.fetch(:id))
    order = item.order_id
    item.delete

    redirect_to order_path(order)
  end

  def update
    item = Item.find(params.fetch(:id))
    item.update(item_params)
    item.add_price_kg
    if item.save!
      redirect_to order_path(item.order_id)
    else
      redirect_to edit_item_path(item)
    end
  end

  def item_params
    params.require(:item).permit(:steel_type_id, :steel_grade_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg, :order_id)
  end
end
