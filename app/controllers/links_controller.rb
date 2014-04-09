class LinksController < ApplicationController

  def all
    @links = Link.all
  end

  def index
    @links = Link.all
  end

  def new
    require_authentication
    @link = Link.new
    @user = User.find(params[:user_id])
  end

  def create
    require_authentication
    current_user.links.create(link_params)
    # @link = Link.create(link_params)
    # ===== next two lines are equivalent =====
    # current_user.links.push(@link)
    # @link.update(user_id: params[:user_id])
    redirect_to root_path
  end

  private
  def link_params
    params.require(:link).permit(:title, :link_url, :img_url)
  end


end
