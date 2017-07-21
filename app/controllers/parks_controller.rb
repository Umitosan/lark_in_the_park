class ParksController < ApplicationController

  def index
    @parks = Park.all
    json_response(@parks)
  end

  def search
    if params[:name] && params[:national]
      render status: 406, json: {
          message: "oops! too many search options, try just one"
      }
    elsif params[:name]
      @parks = Park.search(params[:name])
      json_response(@parks)
    elsif params[:national]
      @parks = Park.getNational(params[:national])
      json_response(@parks)
    end
  end

  def random
    @park = Park.all.sample(1)
    json_response(@park)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create!(park_params)
    render status: 201, json: {
        park: @park,
        message: "The park was created"
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
    params.permit(:name, :description, :national_park)
  end

end
