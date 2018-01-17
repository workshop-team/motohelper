class AddCoOrdinatesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :latitude, :decimal
    add_column :users, :longitude, :decimal
  end
end
