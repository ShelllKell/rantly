class ChangingNamesOfFollowsTable < ActiveRecord::Migration
  def change
    rename_table :followers, :follows
    rename_column :follows, :user_id, :follower_id
    rename_column :follows, :following, :followee_id
  end
end
