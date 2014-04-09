class User < ActiveRecord::Base
  has_secure_password

  has_many(:links)
  has_many(:votes)
  has_many(:rankings, through: :votes)

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: {minimum: 5}

  # test this later
  # validates :admin, inclusion: { in: [true,false]}
end
