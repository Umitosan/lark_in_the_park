require 'rails_helper'

describe "delete a park route", :type => :request do

  before do
    someState = FactoryGirl.create(:state)
    @somePark = FactoryGirl.create(:park, state_id: someState.id)
    delete('/parks/' + @somePark.id.to_s, params: { :name => 'Jurassic Park' })
  end

  it 'returns deleted status' do
    expect(response).to have_http_status(200)
  end

  it 'returns the success message' do
    expect(JSON.parse(response.body)['message']).to eq("The park, #{@somePark.name}, has been deleted FOREVER!")
  end

end
