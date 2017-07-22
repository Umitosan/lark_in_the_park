require 'rails_helper'

describe "the search park path ", :type => :request do

  someState = FactoryGirl.create(:state)

  testPark = FactoryGirl.create(:park, name: 'Yosemite', national_park: true, state_id: someState.id)

  10.times do
    FactoryGirl.create(:park, state_id: someState.id)
  end

  it 'returns error 406 without params' do
    get('/parks_search')
    expect(response).to have_http_status(406)
  end

  it 'returns the found parks' do
    get('/parks_search?name=Yosemite')
    expect(JSON.parse(response.body)[0]['name']).to eq('Yosemite')
  end

  it 'returns a 202 status' do
    get('/parks_search?name=Yosemite')
    expect(response).to have_http_status(202)
  end

  it 'returns the found parks' do
    get('/parks_search?national=true')
    expect(JSON.parse(response.body)[0]['national_park']).to eq(true)
  end

  it 'returns a 202 status' do
    get('/parks_search?national=true')
    expect(response).to have_http_status(202)
  end

end
