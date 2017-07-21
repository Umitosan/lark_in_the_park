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
    @state = State.create!(state_params)
    render status: 201, json: {
        state: @state,
        message: "The state has been created!"
    }
  end

  def update
    @state = State.find(params[:id])
    if @state.update!(state_params)
      render status: 202, json: {
          state: @state,
          message: "The state has been updated!"
      }
    end
  end

  def destroy
    @state = State.find(params[:id])
    stateName = @state.name
    if @state.destroy!
      render status: 202, json: {
          message: "The state, #{stateName}, has been delete FOREVER!"
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render(json: object, status: status)
  end

  def state_params
    params.permit(:name, :description, :national_park)
  end

end
