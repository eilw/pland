class RelationshipsToItem < ActiveRecord::Migration
  def change
    add_reference :items, :steel_type, index: true, foreign_key: true
    add_reference :items, :steel_width, index: true, foreign_key: true
    add_reference :items, :steel_finish, index: true, foreign_key: true
  end
end
