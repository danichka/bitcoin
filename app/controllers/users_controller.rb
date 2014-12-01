class UsersController < ApplicationController
  #TODO поиск пользователя переписать в before_action (rusrails) 

  def home
  end

  def show
    @user = User.find(params[:id])
    @bitcoin_addresses = BitcoinAddress.all
  end
end