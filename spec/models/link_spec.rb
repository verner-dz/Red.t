require 'spec_helper'

describe Link do

  it {should belong_to(:user)}
  it {should belong_to(:ranking)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:link_url)}
  it {should validate_uniqueness_of(:link_url)}
  subject(:link) { Link.create(title: "a", link_url: "ab")}

  describe "#upvote" do
    it "should increase score by 1" do
      ranking = Ranking.create(score: 0)
      #when you call out the subject :link, you can use link
      link.update(ranking_id: ranking.id)
      link.upvote
      expect(link.ranking.score).to eq(1)
    end
  end

   describe "#downvote" do
    it "should decrease score by 1" do
      ranking = Ranking.create(score: 0)
      #when you call out the subject :link, you can use link
      link.update(ranking_id: ranking.id)
      link.downvote
      expect(link.ranking.score).to eq(-1)
    end
  end

end
