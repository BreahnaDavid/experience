class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :full_name, null: false
      t.timestamps null: false
    end
  end
end
