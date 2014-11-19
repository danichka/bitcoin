class CreateBitcoinTransactions < ActiveRecord::Migration
  def change
    create_table :bitcoin_transactions do |t|

      t.string :tid
      t.belongs_to :bitcoin_address
      t.column :amount, :bigint, null: false
      t.timestamps
    end
  end
end