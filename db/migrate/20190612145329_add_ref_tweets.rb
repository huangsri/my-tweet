class AddRefTweets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :tweets
  end
end
