class Ranking < ActiveRecord::Base
  has_and_belongs_to_many(:users)
  belongs_to(:link)

  validates :score, numericality: {only_integer: true}

end
