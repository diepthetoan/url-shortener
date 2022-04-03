class UsersController < ActionController::Base
  before_action :current_user, only: [:links, :create_link, :delete_link]

  def links
    @links = @user.links
  end

  def create_link
    Link.create!(original_url: link_params[:original_url], user: @user)

    redirect_to links_user_path
  end

  def update_link
    @link = Link.find(params[:link_id])
    @link.update(original_url: link_params[:original_url])

    redirect_to links_user_path(id: params[:user_id])
  end

  def delete_link
    @link = Link.find(params[:link_id])
    @link.destroy

    redirect_to links_user_path(@user)
  end

  def link
    @link = Link.find(params[:link_id])
  end

  private

  def user_params
    params.permit(:id)
  end

  def link_params
    params.require(:link).permit(:original_url)
  end

  def current_user
    @user = User.find(user_params[:id])
  end
end
