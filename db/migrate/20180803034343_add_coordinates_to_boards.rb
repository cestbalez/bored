class AddCoordinatesToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :latitude, :float
    add_column :boards, :longitude, :float
  end
end
