class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    url = request.referrer.split("/")
    @user = User.find_by id: url[url.length - 1]
    if @user
      current_user.follow @user
      respond_to do |format|
        format.html{redirect_to @user}
        format.js
      end
    else
      flash[:notice] = t "users.find_user.flash"
      redirect_to users_path
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    if @user
      current_user.unfollow @user
      respond_to do |format|
        format.html{redirect_to @user}
        format.js
      end
    else
      flash[:notice] = t "users.find_user.flash"
      redirect_to users_path
    end
  end
end
