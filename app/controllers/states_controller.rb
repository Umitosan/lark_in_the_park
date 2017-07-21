class StatesController < ApplicationController

  def index
    @states = State.all
    json_response(@states)
  end

  def show
    @state = State.find(params[:id])
    json_response(@state)
  end

  def create
    @state = State.create(state_params)
    json_response(@state)
  end

  def update
    @state = State.find(params[:id])
    @state.update(state_params)
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
  end

  private
  def json_response(object, status = :ok)
    render(json: object, status: status)
  end

  def state_params
    params.permit(:name, :description, :national_park)
  end

end
