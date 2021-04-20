module UserHelper
  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |friendship| friendship.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def reject_friend(user)
    friendship = inverse_friendships.find { |friendship| friendship.user == user }
    friendship.confirmed = false
    friendship.save
  end

  def remove_friend(user)
    reject_friend(user)
  end

  def send_friend_request(user)
    friendship = inverse_friendships.find { |friendship| friendship.user == user }
    friendship.status = 'pending'
    friendship.save
  end

  def get_friend_request(user)
    friendship = inverse_friendships.find { |friendship| friendship.user == user }
    friendship.status = 'to_confirm'
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end
end