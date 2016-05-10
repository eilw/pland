class AddItemIdToSteelType < ActiveRecord::Migration
  def change
    add_reference :steel_types, :item, index: true, foreign_key: true
  end
end
