require 'rails_helper'

describe State do

  it { should validate_presence_of :name }

  it { should have_many :parks }

end
