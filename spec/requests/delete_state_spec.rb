require 'rails_helper'

describe "delete a state route", :type => :request do

  let!(:states) { FactoryGirl.create_list(:state, 10)}

  before do
    @someState = State.first
    delete('/states/' + @someState.id.to_s, params: { :name => 'Kathmandu' })
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:accepted)
  end

  it 'returns the success message' do
    expect(JSON.parse(response.body)['message']).to eq("The state, #{@someState.name}, has been deleted FOREVER!")
  end


end
