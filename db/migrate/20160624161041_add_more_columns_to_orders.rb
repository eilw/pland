class AddMoreColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :transport_cost, :decimal
    add_column :orders, :cost, :decimal
    add_column :orders, :status, :string, :default => 'draft'
    add_column :orders, :comment, :text
  end
end
