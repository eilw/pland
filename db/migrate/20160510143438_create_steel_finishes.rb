class CreateSteelFinishes < ActiveRecord::Migration
  def change
    create_table :steel_finishes do |t|
      t.string :type
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
