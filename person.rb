class Person
  def initialize(name, age = 'unknown', parent_permission = 'true')
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getter
  attr_accessor :name, :age
  attr_reader :parent_permission

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end
