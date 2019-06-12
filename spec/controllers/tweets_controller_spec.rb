require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe '#index' do
    subject(:response) { get :index }

    it 'assigns @tweet' do
      subject
      expect(assigns(:tweet)).to be_an_instance_of(Tweet)
    end

    it 'assigns @tweets' do
      tweet1 = create(:tweet)
      tweet2 = create(:tweet)

      subject
      expect(assigns(:tweets)).to contain_exactly(tweet1, tweet2)
    end


    it 'order @tweets desc by created at' do
      tweet_yesterday = create(:tweet, created_at: 1.day.ago)
      tweet_now = create(:tweet, created_at: Time.zone.now)

      subject
      expect(assigns(:tweets)).to eq([tweet_now, tweet_yesterday])
    end

  end

end
