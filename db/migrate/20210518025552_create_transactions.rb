class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :vendor
      t.string :receipt
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
