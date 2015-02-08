class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    @wiki.is_private && (@wiki.users.include?(user)) || @wiki.is_private && (wiki.user == user) || (user.present? && user.admin?) || !@wiki.is_private
  end

  def update?
    user.present? #&& (@wiki.user == user) || user.present? && !@wiki.is_private || (user.present? && user.admin?)
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
      wikis = []
      if user.present? && user.standard?
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.is_private? && wiki.users.include?(user)
            wikis << wiki
          end
        end
      elsif user.present? && user.premium?
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.user == user
            wikis << wiki
          elsif wiki.is_private? && wiki.users.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end

end
