require_relative './person'
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  # setter method for classroom
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def create_json
    super.merge({type:self, classroom:@classroom})
  end
end
