class ChangeColumnNameInBoard < ActiveRecord::Migration[5.2]
  def change
    rename_column :boards, :type, :category
  end
end
