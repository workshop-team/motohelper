class ChangeUserLatAndLongToString < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :latitude, :string
    change_column :users, :longitude, :string
  end
end
