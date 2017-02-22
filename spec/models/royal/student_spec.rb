require 'rails_helper'

describe Royal::Student do
  it 'is invalid' do
    student = described_class.new

    expect(student.valid?).to be_falsey
  end

  it 'is valid' do
    student = described_class.new(full_name: 'Bob Marley')

    expect(student.valid?).to be_truthy
  end

  describe '#teachers' do
    let(:teacher) do
      Teacher.new(full_name: 'Werner Heisenberg')
    end

    let(:student) do
      described_class.new(
        full_name: 'Bob Marley',
        teachers: [teacher]
      )
    end

    before(:each) do
      teacher.save
      student.save
    end

    it 'has a teacher' do
      expect(student.teachers.count).to eq 1
      expect(student.teachers.first).to eq teacher
    end

    it 'destroys a student with teachers' do
      student.destroy

      expect{ student.reload }.to raise_exception(
        ActiveRecord::RecordNotFound
      )
    end
  end

  it 'destroys a student without teachers' do
    student = described_class.create!(full_name: 'Bob Marley')

    expect{ student.destroy.reload }.to raise_exception(
      ActiveRecord::RecordNotFound
    )
  end
end
