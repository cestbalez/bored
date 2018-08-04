class RemoveLatitudeAndLongitudeFromBoard < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :latitude, :float
    remove_column :boards, :longitude, :float
  end
end
