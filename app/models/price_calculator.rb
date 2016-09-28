class PriceCalculator
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def price_kg
    if grade && width && finish
      grade.cost + width.cost + finish.cost
    else
      0
    end
  end

  def cost_item
    volume * price_kg
  end

  private

  def volume
    params['volume'].to_i
  end

  def grade
    SteelGrade.find_by(id: params.fetch('steel_grade_id', nil))
  end

  def width
    SteelWidth.find_by(id: params.fetch('steel_width_id', nil))
  end

  def finish
    SteelFinish.find_by(id: params.fetch('steel_finish_id', nil))
  end
end
