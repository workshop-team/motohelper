class AddFieldsToReminder < ActiveRecord::Migration[5.1]
  def change
    add_column :reminders, :sended, :date
    add_column :reminders, :archived, :date
  end
end
