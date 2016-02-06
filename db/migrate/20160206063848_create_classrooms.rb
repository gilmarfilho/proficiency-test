class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
    	t.datetime :entry_at, array: true, default: []
    	t.references :course, index: true
    	t.references :student, array: true, default: [], index: true

    	t.timestamps
    end
  end
end
