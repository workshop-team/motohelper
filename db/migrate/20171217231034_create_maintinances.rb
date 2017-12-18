class CreateMaintinances < ActiveRecord::Migration[5.1]
  def change
    create_table :maintinances do |t|
      t.string :name
      t.integer :mileage
      t.date :warranty_date
      t.text :note
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
