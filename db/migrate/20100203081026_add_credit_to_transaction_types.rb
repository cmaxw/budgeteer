class AddCreditToTransactionTypes < ActiveRecord::Migration
  def self.up
    add_column :transaction_types, :credit, :boolean
  end

  def self.down
    remove_column :transaction_types, :credit
  end
end
