# This controller handles actions related to Shows.

class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show update destroy ]

  # GET /shows
  def index
    @shows = Show.includes(:venue, performances: :artists)
                 .all
                 .as_json(
                   except: %i[created_at updated_at],
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
    if params[:new_venue].present?
      @venue = Venue.new(new_venue_params)

      if @venue.save
        @show = Show.new(show_params)
        @show.venue_id = @venue.id

        if @show.save
          render json: @show, status: :created, location: @show
        else
          render json: @show.errors, status: :unprocessable_entity
        end
      else
        render json: @venue.errors, status: :unprocessable_entity
      end
    else
      @show = Show.new(show_params)

      if @show.save
        render json: @show, status: :created, location: @show
      else
        render json: @show.errors, status: :unprocessable_entity
      end
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

    def set_show
      @show = Show.find(params[:id])
    end


    # Strong parameters for Show model
    def show_params
      params.require(:show).permit(
        :title, :description, :url_flyer, :show_recording_link, :event_date, :venue_id
      )
    end

  # Strong parameters for new_venue
    def new_venue_params
      params.require(:new_venue).permit(
        :name, :url_location, :city, :country
      )
    end
end
