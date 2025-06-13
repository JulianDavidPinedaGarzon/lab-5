class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.persisted?
      can :read, Chat, sender_id: user.id
      can :read, Chat, receiver_id: user.id

      # Option 1: Only allow admins to view all users
      if user.admin? # Assuming you have an 'admin' boolean column in User model
        can :read, User # Admins can read all users
      else
        can :read, User, id: user.id # Regular users can only read their own profile
      end
    end
  end
end