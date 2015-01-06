# Pundit policie

#Index of users only available to admin

class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

 def initialize(current_user, model)
   @current_user = current_user
   @user = model
 end



  class Scope < ApplicationPolicy::Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.has_role? :admin
        scope.all
      else
        scope.none
      end
    end

    def index?
      @current_user.has_role? :admin
    end
  end
end 