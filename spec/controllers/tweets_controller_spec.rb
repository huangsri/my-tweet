# frozen_string_literal: true

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

    describe '#create' do
      subject(:response) { post :create }

      context 'when not signed in ' do
        it 'redirects to sign in page ' do
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'when already signed in ' do
        before { sign_in create(:user) }

        subject(:response) do
          post :create, params: params
        end

        let(:params) do
          {
            tweet: {
              content: 'test content'
            }
          }
        end

        it 'creates tweet' do
          expect { subject }.to change { Tweet.all.size }.by(1)
        end

        it "doesn't create tweet when params are invalid" do
          params[:tweet][:content] = ''

          expect { subject }.not_to change { Tweet.all.size }
        end

        it 'redirects to index' do
          expect(response).to redirect_to(tweets_path)
        end
      end
    end
  end
end
