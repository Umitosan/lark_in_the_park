class ParksController < ApplicationController

  def index
    if params[:name]
      parkName = params[:name]
      @parks = Park.search(parkName)
    else
      @parks = Park.all
    end
    json_response(@parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create!(park_params)
    render status: 201, json: {
        park: @park,
        message: "park was created"
    }
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
      render status: 202, json: {
          park: @park,
          message: "The park has been updated"
      }
    end
  end

  def destroy
    @park = Park.find(params[:id])
    parkName = @park.name
    if @park.destroy!
      render status: 200, json: {
          message: "The park, #{parkName}, has been delete FOREVER!"
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render(json: object, status: status)
  end

  def park_params
    params.permit(:name)
  end

end
