require 'spec_helper'

describe Ranking do

  it {should have_and_belong_to_many(:users)}
  it {should belong_to(:link)}

  it {should validate_numericality_of(:score).only_integer}


end
