class RemoveLocationFromBoard < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :location, :string
  end
end
