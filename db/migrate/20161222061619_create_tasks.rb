class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :task_text
      t.integer :user_id
      t.integer :status
      t.timestamps  null: false
    end
  end
end
