class Item < ActiveRecord::Base
  belongs_to :order
  has_one :steel_type
  has_one :steel_finish
  has_one :steel_width
end
