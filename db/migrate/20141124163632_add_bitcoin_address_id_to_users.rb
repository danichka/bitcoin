class AddBitcoinAddressIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bitcoin_address_id, :string
  end
end
