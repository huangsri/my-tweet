class AddLikesToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :likes, :bigint, array: true, default: []
  end
end
