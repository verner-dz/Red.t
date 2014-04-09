class Link < ActiveRecord::Base

  belongs_to(:user)
  belongs_to(:ranking)

  validates :title, :link_url, presence: true
  validates :link_url, uniqueness: true


  def upvote
    # increase myself's ranking's score by 1
    # save changes to database
    self.ranking.score += 1
    self.ranking.save
  end

  def downvote
    self.ranking.score -= 1
    self.ranking.save
  end

  # def self.total_num_of_links
     # all_links = Link.all
     # === is the same as ===
     # all_links = self.all
     # return all_links.size
  # end

end
