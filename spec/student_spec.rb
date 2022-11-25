require_relative '../student'
require_relative '../person'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new('Classroom 1', 18, 'John Doe')
  end

  it 'Student name should be John Doe' do
    expect(@student.name).to eq('John Doe')
  end

  it 'Student age should be 18' do
    expect(@student.age).to eq(18)
  end

  it 'Student classroom should be Classroom 1' do
    expect(@student.classroom).to eq('Classroom 1')
  end

  it 'Student should be instance of Student' do
    expect(@student).to be_instance_of(Student)
  end
end
