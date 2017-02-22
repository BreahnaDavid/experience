class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :full_name, null: false
      t.timestamps null: false
    end
  end
end
