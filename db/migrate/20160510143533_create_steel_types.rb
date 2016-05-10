class CreateSteelTypes < ActiveRecord::Migration
  def change
    create_table :steel_types do |t|
      t.string :type
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
