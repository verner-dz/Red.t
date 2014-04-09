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
    link = Link.find(params[:id])
    if Vote.find_by(user: current_user)
      vote = Vote.find_by(user: current_user)
      if vote.upvote
        # do nothing
      else
        2.times { link.upvote }
        vote.update(downvote: false, upvote: true)
      end
    else
      vote = Vote.create(user: current_user, ranking: link.ranking)
      link.upvote
      vote.update(upvote: true)
    end
    redirect_to links_path
  end

  def downvote
    link = Link.find(params[:id])
    if Vote.find_by(user: current_user)
      vote = Vote.find_by(user: current_user)
      if vote.downvote
        # do nothing
      else
        2.times { link.downvote }
        vote.update(downvote: true, upvote: false)
      end
    else
      vote = Vote.create(user: current_user, ranking: link.ranking)
      link.downvote
      vote.update(downvote: true)
    end
    redirect_to links_path
  end

  private
  def link_params
    params.require(:link).permit(:title, :link_url, :img_url)
  end


end
