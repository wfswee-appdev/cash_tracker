class AddDateToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :date, :date, null: false, index: true
  end
end
