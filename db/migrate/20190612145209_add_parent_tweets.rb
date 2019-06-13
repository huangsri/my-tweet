class AddParentTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :parent_id, :integer, null: true, index: true
    add_foreign_key :tweets, :tweets, column: :parent_id
  end
end
