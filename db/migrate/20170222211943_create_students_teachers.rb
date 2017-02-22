class CreateStudentsTeachers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :students, :teachers do |t|
      t.index [:student_id, :teacher_id], unique: true
    end
  end
end
