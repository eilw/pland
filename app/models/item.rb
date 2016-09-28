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

  def add_price_kg(calculator_klass)
    calculator = calculator_klass.new(steel_params)
    self.price_kg = calculator.price_kg
  end

  def cost
    self.price_kg * self.volume
  end

  private

  def steel_params
    {
      'steel_grade_id' => steel_grade_id,
      'steel_width_id' => steel_width_id,
      'steel_finish_id' => steel_finish_id
    }
  end
end
