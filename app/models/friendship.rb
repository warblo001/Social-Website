class Friendship < ApplicationRecord
  belongs_to :friend, :class_name => "User", foreign_key: 'user_id' 
  belongs_to :user
end
