class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweets_params)
    redirect_to tweets_path if @tweet.save
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    redirect_to tweets_path if @tweet.destroy
  end

  private

  def tweets_params
    params.require(:tweet).permit(:content).merge!(user_id: current_user.id)
  end

end
