class Tweets::LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    if @like.empty?
      @tweet.likes.create(user_id: current_user.id) 
    else
      @like.destroy
    end
    redirect_to root_path
  end

  def show
    puts "=========================================================="
  end
end