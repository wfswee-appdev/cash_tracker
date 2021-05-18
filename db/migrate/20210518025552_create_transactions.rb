class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, null: false
      t.string :vendor, index: true
      t.string :receipt
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
