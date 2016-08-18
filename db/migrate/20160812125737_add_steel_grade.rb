class AddSteelGrade < ActiveRecord::Migration
  def change
    create_table :steel_grades do |t|
      t.string :grade
      t.decimal :cost

      t.timestamps null: false
    end

    remove_column :steel_types, :cost, :decimal
    remove_column :steel_widths, :steel_type, :string

    add_reference :steel_grades, :steel_type, index: true, foreign_key: true
    add_reference :steel_widths, :steel_type, index: true, foreign_key: true
    add_reference :items, :steel_grade, index: true, foreign_key: true
  end
end
