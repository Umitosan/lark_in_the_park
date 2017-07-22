require 'rails_helper'

describe "the states path ", :type => :request do

  someState = FactoryGirl.create(:state)

  10.times do
    FactoryGirl.create(:park, state_id: someState.id)
  end

  before { get '/random_park'}

  it 'returns status code 202' do
    expect(response).to have_http_status(202)
  end

  it 'returns a park' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

end
