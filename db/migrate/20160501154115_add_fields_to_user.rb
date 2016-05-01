class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :country, :string
    add_column :users, :phone_num, :string
  end
end
