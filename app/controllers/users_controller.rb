class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, except: [:create]

  def index

  end

  def create
    respond_to do |format|
      if params[:user][:name] == "tianyuan"
        session[:user_id] = 'tianyuan'
        format.html{redirect_to users_path, alert:'欢迎您，亲爱的，'}
      else
        format.html{redirect_to :back,alert:'请重新输入秘密'}
      end
    end
  end

  def show
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
