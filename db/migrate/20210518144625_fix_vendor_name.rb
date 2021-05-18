class FixVendorName < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :vendor, :category, default: "Lunch", null: False, index: True
  end
end
