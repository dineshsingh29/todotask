class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.text :list_text
      t.integer :status
      t.integer :listable_id
      t.string :listable_type

      t.timestamps  null: false
    end
  end
end
