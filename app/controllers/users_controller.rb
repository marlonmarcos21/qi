class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :user, only: %i(index show)

  def index
    user_locations
  end

  def show
    user_locations
  end

  def user_locations
    page = params[:page] || 1
    @locations = @user
                   .locations
                   .order(created_at: :desc)
                   .page(page)
  end

  private

  def user
    @user = action_name == 'index' ? current_user : User.find(params[:id])
  end
end
