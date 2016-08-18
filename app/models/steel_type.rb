class SteelType < ActiveRecord::Base
  has_many :items
  has_many :steel_grades
  has_many :steel_widths

  def steel_grade_options
    SteelGrade.where(steel_type_id: self.id)
  end

  def steel_width_options
    SteelWidth.where(steel_type_id: self.id)
  end
end
