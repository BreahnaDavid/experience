class RoyalStudentsTeachers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :royal_students, :teachers do |t|
      t.index [:royal_student_id, :teacher_id],
        name: 'index_royal_students_teachers_on_student_id_and_teacher_id',
        unique: true
    end
  end
end
