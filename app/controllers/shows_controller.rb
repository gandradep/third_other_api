# This controller handles actions related to Shows.

class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show update destroy ]

  # GET /shows
  def index
    @shows = Show.includes(:venue, performances: :artists)
                 .all
                 .as_json(
                   except: %i[id created_at updated_at],
                   include: {
                     venue: { except: %i[created_at updated_at] },
                     performances: {
                       include: {
                         artists: { except: %i[id created_at updated_at] }
                       }
                     }
                   }
                 )
    render json: @shows
  end

  # GET /shows/1
  def show
    render json: @show
  end

  # POST /shows
  def create
    @show = Show.new(show_params)

    # Check if new_venue parameters are present
    if show_params[:new_venue].present?
      @venue = Venue.new(show_params[:new_venue])
      if @venue.save
        @show.venue_id = @venue.id
      else
        render json: @venue.errors, status: :unprocessable_entity
        return
      end
    end

    if @show.save
      render json: @show, status: :created, location: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shows/1
  def update
    if @show.update(show_params)
      render json: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shows/1
  def destroy
    @show.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.require(:show).permit(
        :title, :description, :url_flyer, :show_recording_link, :event_date, :venue_id,
        new_venue: [:name, :url_location, :city, :country]
      )
    end
end
