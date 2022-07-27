class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string  :name
      t.string  :author
      t.integer :state, default: 0
      t.timestamps

      t.references :category
    end
  end
end
