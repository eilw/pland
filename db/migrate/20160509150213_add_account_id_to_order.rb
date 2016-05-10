class AddAccountIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :account, index: true, foreign_key: true
  end
end
