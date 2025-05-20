class PlacesController < ApplicationController
  def index
    @places = Place.all.order(:name) # Get all places, ordered by name
  end

  def show
    @place = Place.find(params["id"])
    @entries = @place.entries.order(posted_on: :desc) # Get entries for this place, newest first
  end

  def new
    @place = Place.new # For the form
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path # Redirect to the list of places on successful save
    else
      # If save fails (e.g., validation error), re-render the new form
      # so the user can see errors and try again.
      render :new, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
