class AddCategoryToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :category, :string, default: "Lunch", index: true, null: false
  end
end
