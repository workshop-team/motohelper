class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.string :name, null: false
      t.date :reminder_date
      t.integer :mileage
      t.text :note
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
