require 'spec_helper'

describe Vote do

  it {should belong_to(:ranking)}
  it {should belong_to(:user)}

end
