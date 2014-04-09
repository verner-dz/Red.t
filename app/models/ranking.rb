class Ranking < ActiveRecord::Base
  has_many(:users, through: :votes)
  has_many(:votes)
  belongs_to(:link)

  validates :score, numericality: {only_integer: true}






end
