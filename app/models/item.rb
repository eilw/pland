require('no_item')

class Item < ActiveRecord::Base
  validates :steel_type, presence: true
  validates :steel_grade, presence: true
  validates :steel_finish, presence: true
  validates :steel_width, presence: true
  validates :volume, presence: true
  validates_numericality_of :volume, :greater_than_or_equal_to => 100
  
  belongs_to :order
  belongs_to :steel_type
  belongs_to :steel_finish
  belongs_to :steel_width
  belongs_to :steel_grade

  def add_price_kg
    cost_grade = SteelGrade.find(self.steel_grade_id).cost
    cost_width = SteelWidth.find(self.steel_width_id).cost
    cost_finish = SteelFinish.find(self.steel_finish_id).cost

    self.price_kg = cost_grade + cost_width + cost_finish
  end

  def cost
    self.price_kg * self.volume
  end

  def self.price_kg(params)
    grade = SteelGrade.find_by(id: params["steel_grade_id"]) || NoItem.new
    width = SteelWidth.find_by(id: params["steel_width_id"]) || NoItem.new
    finish = SteelFinish.find_by(id: params["steel_finish_id"]) || NoItem.new

    grade.cost + width.cost + finish.cost
  end
end
