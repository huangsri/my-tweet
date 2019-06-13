class AddRetweetColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :retweet_comment, :string
  end
end
