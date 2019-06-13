require 'pry-byebug'

class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.order('created_at DESC')
  end

  def create
    tweet = Tweet.new(tweets_params)
    return if tweet.content.blank?
    redirect_to tweets_path if tweet.save
  end

  def show
    # @tweet = Tweet.find(params[:id])
    puts '=============================================================='
    puts @tweets
    @tweets = render_tweet(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    binding.pry
    redirect_to tweets_path if tweet.destroy
  end
  
  def like
    tweet = Tweet.find(params[:id])
    if tweet.likes.include?(current_user.id)
      tweet.likes.delete(current_user.id)
    else
      tweet.likes << current_user.id
    end
    redirect_to tweets_path if tweet.save
  end

  def reply_form
    @tweet = Tweet.new
  end

  def reply
    tweet = Tweet.new(tweets_params_with_reply)
    redirect_to tweets_path if tweet.save
  end

  def retweet_form
    @tweet = Tweet.new
  end

  def retweet
    tweet = Tweet.new(tweets_params_with_retweet)
    redirect_to tweets_path if tweet.save
  end

  

  private

    def tweets_params
      params.require(:tweet).permit(:content).merge(user_id: current_user.id)
    end

    def tweets_params_with_reply
      params.require(:tweet).permit(:content).merge(user_id: current_user.id, parent_id: params[:id])
    end

    def tweets_params_with_retweet
      tweet = Tweet.find(params[:id])
      params.require(:tweet)
        .permit(:retweet_comment)
        .merge(user_id: current_user.id, retweet_id: params[:id], content: tweet.content)
    end

    def render_tweet(id)
      tweet = Tweet.find(id)
      if tweet.parent_id.nil?
        [ tweet ]
      else
        [tweet, render_tweet(tweet.parent_id)]
      end
    end


end
