class LinksController < ApplicationController

  def all
    @links = Link.all.sort_by { |link| link.ranking.score }.reverse
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
      ranking.update(link_id: @link.id)
      # @link.ranking_id = @ranking.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def upvote
=begin
    if vote exists and its an upvote
      set vote upvote to false and vote downvote to false
      reduce ranking score by 1
    elsif vote exists and its a downvote
      set vote upvote to true, downvote to false
      increase ranking score by 2
    elsif vote exists and its neither
      set vote upvote to true
      increase ranking score by 1
    else # vote doesn't exist
      create vote (set upvote: true, downvote: false, ranking: ranking, user: current_user)
      update score by 1
    end
=end
    link = Link.find(params[:id])
    vote = link.ranking.votes.find_by(user: current_user)
    if vote && vote.upvote
      vote.update(upvote: false)
      link.downvote
    elsif vote && vote.downvote
      vote.update(upvote: true, downvote: false)
      2.times { link.upvote }
    elsif vote && !vote.upvote && !vote.downvote
      vote.update(upvote: true)
      link.upvote
    else # vote doesn't exist
      vote = link.ranking.votes.create(user: current_user, ranking: link.ranking, upvote: true, downvote: false)
      link.upvote
    end
    redirect_to links_path
  end

  def downvote
    link = Link.find(params[:id])
    vote = link.ranking.votes.find_by(user: current_user)
    if vote && vote.downvote
      vote.update(downvote: false)
      link.upvote
    elsif vote && vote.upvote
      vote.update(upvote: false, downvote: true)
      2.times { link.downvote }
    elsif vote && !vote.upvote && !vote.downvote
      vote.update(downvote: true)
      link.downvote
    else # vote doesn't exist
      vote = link.ranking.votes.create(user: current_user, ranking: link.ranking, upvote: false, downvote: true)
      link.downvote
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :link_url, :img_url)
  end


end
