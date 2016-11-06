class FollowingController < ApplicationController

  before_action :set_folllow, only: :show
  before_action :require_user, only: [:create]

  def index
    if current_user
  end
  



end
