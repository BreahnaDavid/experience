class Student < ActiveRecord::Base
  validates :full_name, presence: true

  has_and_belongs_to_many :teachers
end
