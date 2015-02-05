

class LinkcatPolicy < ApplicationPolicy
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
      elsif user.has_role? :sandbox
        scope.where(user_id: @user.id)
      else
        scope.none  
      end
    end

        

    def index?
      @current_user.has_role? :admin or :sandbox
    end
  end
end 