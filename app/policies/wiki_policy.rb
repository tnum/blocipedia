class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    !@wiki.is_private || @wiki.is_private && (@wiki.user == user) ||(user.present? && user.admin?)
  end

  def update?
    user.present? && (@wiki.user == user) || user.present? && !@wiki.is_private || (user.present? && user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present? && user.premium?
        scope.where(:is_private => true) && scope.where(:user_id => user)
      elsif user.present? && user.standard?
        scope.where(:is_private => false)
      else
        scope.where(:is_private => false)
      end
    end
  end
end
