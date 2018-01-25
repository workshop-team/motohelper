class SetLatandLogToNil < ActiveRecord::Migration[5.1]
  def change
    User.update_all(latitude: nil, longitude: nil)
  end
end
