class AddUserIdToBitcoinAddresses < ActiveRecord::Migration
  def change
    add_column :bitcoin_addresses, :user_id, :integer
  end
end
