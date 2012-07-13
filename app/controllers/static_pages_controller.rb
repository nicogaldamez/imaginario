class StaticPagesController < ApplicationController
  def home
  	@user = User.new
  	render :layout => 'prelogin'
  end

  def help
  end
end
