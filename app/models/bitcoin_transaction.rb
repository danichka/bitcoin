class BitcoinTransaction < ActiveRecord::Base

  belongs_to :bitcoin_address

  validates :bitcoin_address_id, numericality: { greater_than: 0 }

end