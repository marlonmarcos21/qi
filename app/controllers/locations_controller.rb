class LocationsController < ApplicationController
  load_and_authorize_resource

  before_action :location, only: %i(show edit update destroy)

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location.user = current_user
    if @location.save
      flash[:notice] = 'Location created'
      redirect_to(user_location_path(current_user.id, @location.id))
    else
      flash[:alert] = 'Error creating location'
      render :new
    end
  end

  def update
    if @location.update(location_params)
      flash[:notice] = 'Location updated'
      redirect_to(user_location_path(current_user.id, @location.id))
    else
      render :edit
    end
  end

  private

  def location
    return unless params[:id]
    @location = Location.includes(:user).find(params[:id])
  end

  def location_params
    permitted_params = %i(name latitude longitude)
    params.require(:location).permit(*permitted_params)
  end
end
