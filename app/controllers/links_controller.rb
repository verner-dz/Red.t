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
    @link = Link.new(link_params)
    if @link.save
      current_user.links.push(@link)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :link_url, :img_url)
  end


end
