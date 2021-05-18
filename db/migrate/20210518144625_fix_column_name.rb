class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :vendor, :category, default: "Lunch", null: false, index: true
  end
end
