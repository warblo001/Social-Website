class RemoveStatusFromFriendship < ActiveRecord::Migration[6.1]
  def change
    remove_column :friendships, :status
  end
end
