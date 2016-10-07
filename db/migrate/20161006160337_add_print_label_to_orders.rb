class AddPrintLabelToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :print_label, :boolean, default: false
  end
end
