class UsersController < ApplicationController

  def index
    @user = User.all
  end
  def create
    @user = User.new(user_params)
    if @user.save
      render json:@user, status: :created, location: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
      if @user
        render json: @user
      else
        render json: ["Wrong password bro"], status: :unauthorized
      end
  end


  private

  def user_params
    params.permit(:email, :password, :username, :api_token)
  end

end
