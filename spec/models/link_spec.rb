require 'spec_helper'

describe Link do

  it {should belong_to(:user)}
  it {should belong_to(:ranking)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:link_url)}
  it {should validate_uniqueness_of(:link_url)}

end
