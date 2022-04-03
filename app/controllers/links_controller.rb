class LinksController < ActionController::Base
  def index
    user = User.find(link_params[:user_id])
    user.links
  end

  def show
    link = Link.find_by_slug(params[:slug])
    if !link
      render 'errors/404', status: 404
    else
      link.update!(clicked_times: link.clicked_times + 1)
      redirect_to link.original_url
    end
  end
end
