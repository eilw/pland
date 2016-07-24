require('no_item')

class Item < ActiveRecord::Base
  validates :steel_type, presence: true
  validates :steel_finish, presence: true
  validates :steel_width, presence: true
  validates :volume, presence: true
  validates_numericality_of :volume, :greater_than_or_equal_to => 100
  
  belongs_to :order
  belongs_to :steel_type
  belongs_to :steel_finish
  belongs_to :steel_width

  def add_price_kg
    cost_type = SteelType.find(self.steel_type_id).cost
    cost_width = SteelWidth.find(self.steel_width_id).cost
    cost_finish = SteelFinish.find(self.steel_finish_id).cost

    self.price_kg = cost_type + cost_width + cost_finish
  end

  def cost
    self.price_kg * self.volume
  end

  def self.price_kg(params)
    type = SteelType.find_by(id: params["steel_type_id"]) || NoItem.new
    width = SteelWidth.find_by(id: params["steel_width_id"]) || NoItem.new
    finish = SteelFinish.find_by(id: params["steel_finish_id"]) || NoItem.new

    type.cost + width.cost + finish.cost
  end
end
