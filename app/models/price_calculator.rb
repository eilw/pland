class PriceCalculator
  def price_kg(params)
    grade = SteelGrade.find_by(id: params['steel_grade_id'])
    width = SteelWidth.find_by(id: params['steel_width_id'])
    finish = SteelFinish.find_by(id: params['steel_finish_id'])

    if grade && width && finish
      grade.cost + width.cost + finish.cost
    else
      0
    end
  end

  def cost(params)
    volume = params['volume'].to_i

    volume * price_kg(params)
  end
end
