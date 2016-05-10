class AddItemIdToSteelFinish < ActiveRecord::Migration
  def change
    add_reference :steel_finishes, :item, index: true, foreign_key: true
  end
end
