class Link < ActiveRecord::Base

  belongs_to(:user)
  belongs_to(:ranking)

  validates :title, :link_url, presence: true
  validates :link_url, uniqueness: true


end
