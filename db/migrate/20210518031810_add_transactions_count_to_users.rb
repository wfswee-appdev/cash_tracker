class AddTransactionsCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :transactions_count, :integer
  end
end
