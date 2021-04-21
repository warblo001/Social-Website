class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id])
    if @friendship.save
      redirect_to users_path, notice: 'Friend request sent!'
    else
      redirect_to users_path, notice: 'Error! Try again'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @friendship = current_user.inverse_friendships.find { |fship| fship.user == @user }
    @friendship.destroy
    redirect_to users_path, notice: "Removed #{@user.name} from friends"
  end

  def approve
    @user = User.find(params[:user_id])
    @friendship = current_user.inverse_friendships.find { |fship| fship.user == @user }
    @friendship.confirmed = true
    redirect_to users_path(params[:user_id]), notice: "You're now friends with #{@user.name}!" if @friendship.save
  end
end
