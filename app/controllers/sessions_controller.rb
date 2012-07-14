class SessionsController < ApplicationController

	def create
	  
	  user = User.find_by_email(params[:session][:email])
	  if user && user.authenticate(params[:session][:password])
	    flash[:success] = 'Qué alegría tenerte de nuevo ' + user.firstname
	    sign_in user
	    redirect_to user
	  else
	    flash.now[:error] = 'Mmmmh, le pifiaste en algo'
	    render 'new'
	  end
	  
	end
	
	def destroy
	  sign_out
      redirect_to root_path
	end
end
