class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, limit: 25
      t.string :description, limit: 25
      t.integer :status
      t.belongs_to :classroom, index:true

      t.timestamps
    end
  end
end
