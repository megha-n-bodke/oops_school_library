require_relative '../person'
require_relative '../classroom'
require_relative '../teacher'

describe Teacher do
    before :each do
        @teacher = Teacher.new('Math', 30, 'Meghan', parent_permission: true)
    end
     
    it 'Teacher name should be Meghan' do
        expect(@teacher.name).to eq('Meghan')
        expect(@teacher.name).not_to eq('John Doe')
        expect(@teacher.name).not_to be_empty
        expect(@teacher.age).to be > 20
    end

    it 'teacher can use services' do
        expect(@teacher.can_use_services?).to be true
    end
end
