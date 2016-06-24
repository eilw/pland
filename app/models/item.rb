class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :steel_type
  belongs_to :steel_finish
  belongs_to :steel_width

  def calculate_price
    cost_type = SteelType.find(self.steel_type.id).cost
    cost_width = SteelWidth.find(self.steel_width.id).cost
    cost_finish = SteelFinish.find(self.steel_finish_id).cost

    cost_type + cost_width + cost_finish
  end

  def cost
    self.price_kg * self.volume
  end
end
