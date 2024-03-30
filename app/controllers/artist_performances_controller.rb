class ArtistPerformancesController < ApplicationController
  before_action :set_artist_performance, only: %i[ show update destroy ]

  # GET /artist_performances
  def index
    @artist_performances = ArtistPerformance.all

    render json: @artist_performances
  end

  # GET /artist_performances/1
  def show
    render json: @artist_performance
  end

  # POST /artist_performances
  def create
    @artist_performance = ArtistPerformance.new(artist_performance_params)

    if @artist_performance.save
      render json: @artist_performance, status: :created, location: @artist_performance
    else
      render json: @artist_performance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artist_performances/1
  def update
    if @artist_performance.update(artist_performance_params)
      render json: @artist_performance
    else
      render json: @artist_performance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artist_performances/1
  def destroy
    @artist_performance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_performance
      @artist_performance = ArtistPerformance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_performance_params
      params.require(:artist_performance).permit(:artist_id, :performance_id)
    end
end
