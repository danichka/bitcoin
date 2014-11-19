class CreateBitcoinAddresses < ActiveRecord::Migration
  def change
    create_table :bitcoin_addresses do |t|

      t.string :address, null: false
      t.column :final_balance, :bigint
      t.timestamps
    end
  end
end
