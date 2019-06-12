class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params.require(:tweet).permit(:author, :content))
    redirect_to tweets_path if @tweet.save
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    redirect_to tweets_path if @tweet.update(params.require(:tweet).permit(:author, :content))
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    redirect_to tweets_path if @tweet.destroy
  end
end