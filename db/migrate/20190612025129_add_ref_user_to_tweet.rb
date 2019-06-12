class AddRefUserToTweet < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :user
  end
end
