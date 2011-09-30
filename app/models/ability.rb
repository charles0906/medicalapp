class Ability
  include CanCan::Ability
  
  def initialize(user)
     user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :doctor
      can :manage, Wall
      can :read, Appointment
      can :cancel, Appointment
    end
  end
end

