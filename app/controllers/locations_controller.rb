class LocationsController < ApplicationController
  load_and_authorize_resource

  before_action :location, only: %i(show edit update destroy)

  def show
  end

  def new
    @location = Location.new
  end

  def edit
    @media_token = @post.images.first.try(:token) || media_token
  end

  def create
    @location.user = current_user
    if @location.save
      flash[:notice] = 'Location created'
      redirect_to(user_location_path(@location, user_id: current_user.id)) and return
    else
      flash[:alert] = 'Error creating location'
      render :new
    end
  end

  def update
    medium_token = params.delete :media_token

    if @post.update(post_params)
      attach_images medium_token, @post.id
      attach_videos medium_token, @post.id
      redirect_to @post, notice: 'Post updated'
    else
      render :edit
    end
  end

  private

  def location
    @location = Location.includes(:user).find(params[:id])
  end

  def location_params
    permitted_params = %i(name latitude longitude)
    params.require(:location).permit(*permitted_params)
  end
end
