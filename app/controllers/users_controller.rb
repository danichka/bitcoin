class UsersController < ApplicationController
  
  def index
    @user = User.all
  end

  def show
    unless @user = User.find(params[:id])
      render text: "Page not found", status:
      404
    end
  end
  
  def new
    
  end

end