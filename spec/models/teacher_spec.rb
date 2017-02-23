require 'rails_helper'

describe Teacher do
  it 'is invalid' do
    teacher = described_class.new

    expect(teacher.valid?).to be_falsey
  end

  it 'is valid' do
    teacher = described_class.new(full_name: 'Werner Heisenberg')

    expect(teacher.valid?).to be_truthy
  end

  describe '#students' do
    let(:student) do
      Student.new(full_name: 'Bob Marley')
    end

    let(:teacher) do
      described_class.new(
        full_name: 'Werner Heisenberg',
        students: [student]
      )
    end

    before(:each) do
      student.save
      teacher.save
    end

    it 'has a student' do
      expect(teacher.students.count).to eq 1
      expect(teacher.students.first).to eq student
    end

    it 'destroys a teacher with students' do
      teacher.destroy

      expect(teacher.reload.deleted_at).not_to be_nil
    end
  end

  describe '#royal_students' do
    let(:student) do
      Royal::Student.new(full_name: 'Alexander Nevsky')
    end

    let(:teacher) do
      described_class.new(
        full_name: 'Werner Heisenberg',
        royal_students: [student]
      )
    end

    before(:each) do
      student.save
      teacher.save
    end

    it 'has a student' do
      puts teacher
      expect(teacher.royal_students.count).to eq 1
      expect(teacher.royal_students.first).to eq student
    end

    it 'destroys a teacher with students' do
      teacher.destroy

      expect(teacher.reload.deleted_at).not_to be_nil
    end
  end

  it 'destroys a teacher without students' do
    teacher = described_class.create!(full_name: 'Werner Heisenberg')
    teacher.destroy

    expect(teacher.reload.deleted_at).not_to be_nil
  end
end
