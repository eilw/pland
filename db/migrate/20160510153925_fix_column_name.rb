class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :steel_finishes, :type, :finish
    rename_column :steel_types, :type, :steel_type
    rename_column :steel_widths, :type, :steel_type
  end
end
