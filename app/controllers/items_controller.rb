class ItemsController < ApplicationController
    def new
        @item = Item.new
    end

    def create
        current_order.item.create(item_params)
        redirect_to new_order_path
    end
    def item_params
        params.require(:item).permit(:steel_type_id, :steel_width_id, :steel_finish_id, :cost, :volume, :price_kg)
    end
end
