class HomeController < ApplicationController



  def index
    @user = User.new
    render layout: nil
  end

end
