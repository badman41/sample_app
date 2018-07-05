class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost = current_user.microposts.build
    @feed_items = Micropost.by_user_id(current_user.id)
                           .all_order.paginate page: params[:page]
  end

  def help; end

  def about; end
end
