class StaticPagesController < ApplicationController
  def home
  	render :layout => 'prelogin'
  end

  def help
  end
end
