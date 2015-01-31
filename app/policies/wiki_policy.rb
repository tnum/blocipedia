class WikiPolicy < ApplicationPolicy

  def index?
    scope.where(:is_private => true)
  end

end