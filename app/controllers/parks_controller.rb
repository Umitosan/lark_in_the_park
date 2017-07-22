class ParksController < ApplicationController

  def index
    @parks = Park.all.page(params[:page])
    json_response(@parks, :success)
  end

  def search
    if params[:name] && params[:national]
      @parks_by_name = Park.search(params[:name])
      @parks_by_type = Park.getNational(params[:national])
      @unique_parks = (@parks_by_name & @parks_by_type)
      json_response(@unique_parks)
    elsif params[:name]
      @parks_by_name = Park.search(params[:name])
      json_response(@parks_by_name)
    elsif params[:national]
      @parks_by_type = Park.getNational(params[:national])
      json_response(@parks_by_type)
    else
      render status: 406, json: {
          message: "oops! I see no search options"
      }
    end
  end

  def random
    @park = Park.all.sample(1)
    json_response(@park, :success)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park, :success)
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
