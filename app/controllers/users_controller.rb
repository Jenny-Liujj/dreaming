class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]



  def create
    respond_to do |format|
      if params[:user][:name] == "tianyuan"
        format.html{redirect_to users_path, alert:'欢迎您，亲爱的，'}
      else
        format.html{redirect_to :back,alert:'请重新输入秘密'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
