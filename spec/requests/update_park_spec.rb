require 'rails_helper'

describe "the update park path ", :type => :request do

  someState = FactoryGirl.create(:state)

  before do
    someState = FactoryGirl.create(:state)
    @somePark = FactoryGirl.create(:park, state_id: someState.id)
    put('/parks/' + @somePark.id.to_s, params: { name: 'Yosemite', description: 'Soo cool', national_park: true, state_id: someState.id })
  end

  it 'returns the state name' do
    expect(JSON.parse(response.body)['park']['name']).to eq('Yosemite')
  end

  it 'returns the success message' do
    expect(JSON.parse(response.body)['message']).to eq('The park has been updated!')
  end

  it 'returns a accepted status' do
    expect(response).to have_http_status(:accepted)
  end

end
