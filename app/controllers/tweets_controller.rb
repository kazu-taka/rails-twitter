class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_tweet, only: [:show]

  def index
    @tweets = Tweet.page(params[:page])
    @tweet = Tweet.new

  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        @tweets = Tweet.page(params[:page])
        format.html { render :index }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tweets = Tweet.where(reply_tweet_id: @tweet.id)
    @rep_tweet = Tweet.new
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
