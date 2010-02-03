class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :check_number
      t.references :transaction_type
      t.string :payee
      t.float :amount
      t.date_time :payment_date
      t.boolean :cleared

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
