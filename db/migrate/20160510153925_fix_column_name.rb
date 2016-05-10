class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :steel_finishes, :type, :finish
    rename_column :steel_types, :type, :steel_type
    rename_column :steel_widths, :type, :steel_type
  end

  # class AddItemIdToSteelType < ActiveRecord::Migration
  #   def change
  #     add_reference :steel_types, :item, index: true, foreign_key: true
  #   end
  # end
end
