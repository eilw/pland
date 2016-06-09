class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :steel_type
  belongs_to :steel_finish
  belongs_to :steel_width

end
