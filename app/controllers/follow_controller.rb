class FollowController < ApplicationController
  before_action :find_user

  def following
    @title = t ".title"
    @users = @user.following.paginate page: params[:page]
    render "users/show_follow"
  end

  def followers
    @title = t ".title"
    @users = @user.followers.paginate page: params[:page]
    render "users/show_follow"
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:notice] = t "users.find_user.flash"
    redirect_to users_path
  end
end
