class RemoveVendorFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :vendor
  end
end
