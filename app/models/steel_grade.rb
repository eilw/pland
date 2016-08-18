class SteelGrade < ActiveRecord::Base
  has_many :items
  belongs_to :steel_type
end
