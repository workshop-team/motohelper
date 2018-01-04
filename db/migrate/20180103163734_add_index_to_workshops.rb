class AddIndexToWorkshops < ActiveRecord::Migration[5.1]
  def change
    add_index(:workshops, :longitude)
    add_index(:workshops, :latitude)
  end
end
