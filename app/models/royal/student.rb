module Royal
  class Student < ActiveRecord::Base
    validates :full_name, presence: true

    has_and_belongs_to_many(
      :teachers,
      class_name: 'Teacher',
      foreign_key: :royal_student_id
    )
  end
end
