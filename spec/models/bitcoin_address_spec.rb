require 'rails_helper'

RSpec.describe BitcoinAddress, :type => :model do
end

describe BitcoinAddress do

  it "is not equal to 0" do 
    address = BitcoinAddress.new(final_balance:'')
    address.valid?
    address.errors[:final_balance].should_not be_empty
  end

  describe "transactions" do
    before(:all) do 
      @user = User.create!(email: "#{rand(1000)}@mail.ru", password: "12341234")
    end
    
    before(:each) do
      @address = BitcoinAddress.create!(
        address: "1DReAuFz3fCnywW7yii5pJVRUkLvoMRzn5",
        final_balance: 0,
        user: @user
      )
    end
    
    it "fetches transactions from Blockchain.info" do
      expect(@address.fetch_transactions).not_to be_empty
    end
    
    it "parses json from Blockchain.info" do
      # puts @address.fetch_transactions
      expect(@address.fetch_transactions).to be_kind_of(Array)
    end
    
    it "creates transaction record in the db for each parsed transaction" do
      @address.fetch_and_create_transactions!
      expect(@address.reload.bitcoin_transactions.size).to eq(50)
    end
  
  end

end