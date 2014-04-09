require 'spec_helper'

describe Ranking do

  it {should have_many(:users).through(:votes)}
  it {should belong_to(:link)}

  it {should validate_numericality_of(:score).only_integer}





end
