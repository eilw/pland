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
    grade = SteelGrade.find_by(id: steel_grade_id)
    width = SteelWidth.find_by(id: steel_width_id)
    finish = SteelFinish.find_by(id: steel_finish_id)

    if grade && width && finish
      self.price_kg = grade.cost + width.cost + finish.cost
    end
  end

  def cost
    self.price_kg * self.volume
  end
end
