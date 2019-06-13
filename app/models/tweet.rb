class Tweet < ApplicationRecord
  belongs_to :user
  # belongs_to :tweet

  has_one :tweet, dependent: :destroy

  validates :content, presence: true

  def parent
    Tweet.find(parent_id)
  end

  def retweet
    Tweet.find(retweet_id)
  end

  # def replies
  #   Tweet.where(parent_id: id)
  # end

end
