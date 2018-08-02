class AddUserToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :user, index: true
  end
end
