class RemoveCostFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :cost, :integer
  end
end
