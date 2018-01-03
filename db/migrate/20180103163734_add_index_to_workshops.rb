class AddIndexToWorkshops < ActiveRecord::Migration[5.1]
  def change
    add_index(:workshops, [:longitude, :latitude])
  end
end
