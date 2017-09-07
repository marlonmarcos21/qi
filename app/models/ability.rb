class Ability
  include CanCan::Ability

  attr_reader :current_user

  def initialize(user)
    @current_user = user || User.new
    return unless current_user.persisted?

    can :read, [User, Location]
    can :create, Location
    can [:update, :destroy], Location do |location|
      location.user == current_user
    end
  end
end
