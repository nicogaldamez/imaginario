class UsersController < ApplicationController
  
  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      render 'new'
    else
      render 'new'
    end
  end
end
