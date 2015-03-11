class PostPolicy < ApplicationPolicy

 class Scope < Scope

    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.member?
        scope.where(:user_id => user)
      end
    end
  end

  def index?
    true
  end

end