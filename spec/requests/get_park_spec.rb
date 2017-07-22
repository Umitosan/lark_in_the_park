require 'rails_helper'

describe "the parks path ", :type => :request do

  someState = FactoryGirl.create(:state)
  
  10.times do
    FactoryGirl.create(:park, state_id: someState.id)
  end

  before { get '/parks'}

  it 'returns all parks' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
