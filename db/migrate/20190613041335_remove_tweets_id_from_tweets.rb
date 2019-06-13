class RemoveTweetsIdFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :tweets_id, :bigint
  end
end
