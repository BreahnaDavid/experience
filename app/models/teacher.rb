class Teacher < ActiveRecord::Base
  validates :full_name, presence: true

  has_and_belongs_to_many :students
  has_and_belongs_to_many(
    :royal_students,
    class_name: 'Royal::Student',
    association_foreign_key: :royal_student_id
  )
end
