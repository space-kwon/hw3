class EntriesController < ApplicationController
  def new
    @place = Place.find(params["place_id"]) # Get the parent place
    @entry = @place.entries.build # Build a new entry associated with this place (for the form)
    # or @entry = Entry.new
  end

  def create
    @place = Place.find(params["place_id"]) # Get the parent place
    @entry = @place.entries.build(entry_params)
    # @entry.place_id = @place.id # This is handled by @place.entries.build if you do that

    if @entry.save
      redirect_to place_path(@place) # Redirect to the place's show page on successful save
    else
      # If save fails, re-render the new entry form
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :posted_on) # place_id is handled by association
  end
end
