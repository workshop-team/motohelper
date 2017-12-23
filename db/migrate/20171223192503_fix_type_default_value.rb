class FixTypeDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :type, from: nil, to: "RegularUser"
  end
end
