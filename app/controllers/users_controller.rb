class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @tweets = Tweet.where(user_id: @user.id).page(params[:page])
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
