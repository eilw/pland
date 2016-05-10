class AddItemIdToSteelWidth < ActiveRecord::Migration
  def change
    add_reference :steel_widths, :item, index: true, foreign_key: true
  end
end
