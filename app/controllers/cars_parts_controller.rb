class CarsPartsController < ApplicationController
  before_action :set_cars_part, only: [:show, :update, :destroy]

  # GET /cars_parts
  def index
    @cars_parts = CarsPart.all

    render json: @cars_parts
  end

  # GET /cars_parts/1
  def show
    render json: @cars_part
  end

  # POST /cars_parts
  def create
    @cars_part = CarsPart.new(cars_part_params)

    if @cars_part.save
      render json: @cars_part, status: :created, location: @cars_part
    else
      render json: @cars_part.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars_parts/1
  def update
    if @cars_part.update(cars_part_params)
      render json: @cars_part
    else
      render json: @cars_part.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars_parts/1
  def destroy
    @cars_part.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cars_part
      @cars_part = CarsPart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cars_part_params
      params.fetch(:cars_part, {})
    end
end
