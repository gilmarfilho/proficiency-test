class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, limit: 25
      t.string :register_number, limit: 25
      t.integer :status

      t.timestamps
    end
  end
end
