class UsersController < ApplicationController

  before_action :require_user, only: [:show, :login, :follow_user, :unfollow_user]

  def index
    @user = User.all.order("created_at DESC")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
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

  def follow_user
    current_user.follow!(User.find(params[:id]))
    render json: @user
  end

  def unfollow_user
    current_user.unfollow!(User.find(params[:id]))
    render json: @user
  end

  def all_followers
    @followers = User.find(params[:id]).followers(User)
    render json: @followers
  end
  private

  def user_params
    params.permit(:email, :password, :username, :api_token, :id)
  end

end
