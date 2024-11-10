# This controller handles actions related to Shows.

class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show update destroy ]

  # GET /shows
    def index
      Rails.logger.info "Type of @shows: #{ @shows.class }"

      @shows = Show.includes(:venue, performances: :artists).all

      # Retrieve the time zone parameter from the request or a default
      time_zone_str = params[:time_zone] || 'UTC'
      time_zone = ActiveSupport::TimeZone[time_zone_str]

      # Convert the event_date from UTC to the specified time zone
      shows_with_converted_dates = @shows.map do |show|
        show_as_json = show.as_json(
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

        # Convert event_date from UTC to the specified time zone
        event_date_local = show.event_date.in_time_zone(time_zone).strftime('%Y-%m-%dT%H:%M:%S')

        show_as_json.merge(event_date: event_date_local)
      end

      render json: shows_with_converted_dates
    end

  # GET /shows/1
  def show
    render json: @show
  end

  # POST /shows
  def create
    Rails.logger.info "Received show_params: #{show_params.inspect}"

    if params[:new_venue].present?
      @venue = Venue.new(new_venue_params)

      if @venue.save
        @show = Show.new(show_params)
        @show.venue_id = @venue.id

        if @show.save
          render_show(@show)
        else
          render json: @show.errors, status: :unprocessable_entity
        end
      else
        render json: @venue.errors, status: :unprocessable_entity
      end
    else
      @show = Show.new(show_params)
      Rails.logger.info "Final show object before save: #{@show.inspect}"

      if @show.save
        render_show(@show)
      else
        render json: @show.errors, status: :unprocessable_entity
      end
    end
  end
  # PATCH/PUT /shows/1
  def update
    if @show.update(show_params)
      render_show(@show) # Ensures the response format is consistent with `create`
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

    def render_show(show)
      render json: show.as_json
    end

    # Strong parameters for Show model
    def show_params
      params.require(:show).permit(:title, :description, :url_flyer, :show_recording_link, :event_date, :time_zone, :venue_id)
    end

  # Strong parameters for new_venue
    def new_venue_params
      params.require(:new_venue).permit(
        :name, :url_location, :city, :country
      )
    end

    def render_show(show)
      time_zone_str = show.time_zone || 'UTC' # Use the stored time zone or default to UTC
      time_zone = ActiveSupport::TimeZone[time_zone_str]
      event_date_local = show.event_date.in_time_zone(time_zone).strftime('%Y-%m-%dT%H:%M:%S')

      render json: show.as_json(
        except: %i[created_at updated_at],
        include: {
          venue: { except: %i[created_at updated_at] },
          performances: {
            include: {
              artists: { except: %i[id created_at updated_at] }
            }
          }
        }
      ).merge(event_date: event_date_local)
    end

end
