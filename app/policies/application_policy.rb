class ApplicationPolicy
  attr_reader :user, :todo

  def initialize(user, todo)
    @user = user
    @todo = todo
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (todo.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    todo.class
  end
end

