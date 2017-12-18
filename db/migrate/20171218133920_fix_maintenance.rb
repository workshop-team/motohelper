class FixMaintenance < ActiveRecord::Migration[5.1]
  def change
    rename_table :maintinances, :maintenances
    change_column_null :maintenances, :name, false
  end
end
