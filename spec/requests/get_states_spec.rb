require 'rails_helper'

describe "the states path ", :type => :request do

  let!(:states) { FactoryGirl.create_list(:state, 10)}

  before { get '/states'}

  it 'returns all states' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
