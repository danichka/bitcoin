class BitcoinAddress < ActiveRecord::Base
  require "open-uri"
  require 'json'
  has_many   :bitcoin_transactions
  belongs_to :user

  validates :final_balance, numericality: { greater_than_or_equals: 0 }
  validates :address, length: { is: 34 }
  validates :user_id, presence: true
  
  def fetch_transactions
    uri = URI.parse("http://blockchain.info/address/#{address}?format=json")
    JSON.parse(uri.read)["txs"]
  end
  
  def fetch_and_create_transactions!
    transactions = fetch_transactions
    transactions.each do |t|
      BitcoinTransaction.create(
        bitcoin_address_id: id,
        amount: t["out"].first["value"],
        tid: t["hash"]
      )
    end
  
  end
end