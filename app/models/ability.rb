class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.present?

    can :manage, Post, user_id: user.id
    can %i[create destroy], Comment

    return unless user.role == 'admin'

    can :manage, :all
  end
end
