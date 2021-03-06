class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
     user.present? || (record.user == user || user.admin?)
  end

  def scope
    record.class
  end

  def can_moderate?(user, record)
    @user = user
    @record = record 
    user.present? && (record.user == user or user.role?(:admin))  
  end

end

