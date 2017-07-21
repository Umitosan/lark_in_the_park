require 'rails_helper'

describe Park do

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should have_db_column :national_park }

  it { should belong_to :state }

end
