require 'rails_helper'

describe "update a state route", :type => :request do

  before do
    someState = FactoryGirl.create(:state)
    put('/states/' + someState.id.to_s, params: { :name => 'Kathmandu' })
  end

  it 'returns the state name' do
    expect(JSON.parse(response.body)['state']['name']).to eq('Kathmandu')
  end

  it 'returns the success message' do
    expect(JSON.parse(response.body)['message']).to eq('The state has been updated!')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:accepted)
  end

end
