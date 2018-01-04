class AddDeletedAtToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :deleted_at, :datetime
    add_column :cars, :deleted_at, :datetime
    add_column :maintenances, :deleted_at, :datetime
    add_column :reminders, :deleted_at, :datetime

    add_index :users, :deleted_at
    add_index :cars, :deleted_at
    add_index :maintenances, :deleted_at
    add_index :reminders, :deleted_at
  end
end
