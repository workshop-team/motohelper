class AddSlugToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :slug, :string
    add_column :reminders, :slug, :string
    add_column :maintenances, :slug, :string

    add_index :cars, :slug, unique: true
    add_index :reminders, :slug, unique: true
    add_index :maintenances, :slug, unique: true
  end
end
