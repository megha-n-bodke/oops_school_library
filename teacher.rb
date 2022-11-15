require_relative './person'

class Teacher < Person
  def initialize(age, specialization, parent_permission, name = 'unknown')
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
