require 'spec_helper'

describe User do

  it {should have_many(:links)}
  it {should have_many(:rankings).through(:votes)}

  #we have to test comments later

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should have_secure_password}

  it do
    jesse = User.create({
      email: "jesse@gmail.com",
      username: "jesse",
      password: "12345",
      password_confirmation: "12345"
    })
    should validate_uniqueness_of(:username)
    should validate_uniqueness_of(:email)
  end

  it do
    @user = User.create({
      email: "abcd@gmail.com",
      username: "abcd",
      password: 1234,
      password_confirmation: 1234
    })
#testing password length
    should be_invalid
  end

end
