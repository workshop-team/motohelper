class CreateMileages < ActiveRecord::Migration[5.1]
  def change
    create_table :mileages do |t|
      t.integer :meter_status, null:false
      t.references :car, foreign_key: true
      t.date :date, null:false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
