require_relative '../classroom'
describe Classroom do
  before :each do
    @classroom = Classroom.new('Classroom 1')
  end
  it 'Classroom label should be Classroom 1' do
    expect(@classroom.label).to eq('Classroom 1')
  end
  it 'Classroom should be instance of Classroom' do
    expect(@classroom).to be_instance_of(Classroom)
  end
end
