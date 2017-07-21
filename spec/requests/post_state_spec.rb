require 'rails_helper'

describe "post a state route", :type => :request do

  before do
    post '/states', params: { :name => 'Kalamazoo' }
  end

  it 'returns the state name' do
    expect(JSON.parse(response.body)['state']['name']).to eq('Kalamazoo')
  end

  it 'returns the success message' do
    expect(JSON.parse(response.body)['message']).to eq('The state has been created!')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

end
