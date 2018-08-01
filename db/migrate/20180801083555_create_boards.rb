class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :type
      t.boolean :availability
      t.string :photo
      t.text :description
      t.string :location
      t.string :title

      t.timestamps
    end
  end
end
