class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :volume
      t.decimal :price_kg
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
