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
      ranking = Ranking.create(score: 0)
      @link.update(ranking_id: ranking.id)
      # @link.ranking_id = @ranking.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def upvote
    # render text: params.inspect
    link = Link.find(params[:id])
    link.upvote
    redirect_to links_path
  end

  private
  def link_params
    params.require(:link).permit(:title, :link_url, :img_url)
  end


end
