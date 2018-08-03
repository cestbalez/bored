class AddPriceToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :price, :integer
  end
end
