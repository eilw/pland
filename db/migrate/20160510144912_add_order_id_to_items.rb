class AddOrderIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :order, index: true, foreign_key: true
    add_reference :orders, :user, index: true, foreign_key: true
  end
end
