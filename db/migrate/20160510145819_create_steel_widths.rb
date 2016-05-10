class CreateSteelWidths < ActiveRecord::Migration
  def change
    create_table :steel_widths do |t|
      t.string :type
      t.decimal :width
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
