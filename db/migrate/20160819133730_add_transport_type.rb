class AddTransportType < ActiveRecord::Migration
  def change
    create_table :transport_types do |t|
      t.string :transport_type
      t.integer :range_start
      t.decimal :cost

      t.timestamps null: false
    end

    add_column :orders, :transport_type, :string
  end
end
