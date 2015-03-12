class PostPolicy < ApplicationPolicy
 class Scope < Scope
    raise "#{user.guest?}"
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.member?
        scope.where(:user_id => user)
      else 
        scope.none
      end
    end
  end

  def index?
    true
  end
end