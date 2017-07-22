require 'rails_helper'

describe "the post park path ", :type => :request do

  someState = FactoryGirl.create(:state)

  before do
    post '/parks', params: { name: 'Jurassic Park', description: 'Soo cool', national_park: false, state_id: someState.id }
  end

  it 'returns the state name' do
    expect(JSON.parse(response.body)['park']['name']).to eq('Jurassic Park')
  end

  it 'returns the success message' do
    expect(JSON.parse(response.body)['message']).to eq('The park has been created!')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

end
