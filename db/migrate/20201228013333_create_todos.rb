class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos, id: :uuid do |t|
      t.string :description, null: false
      t.text :note
      t.datetime :due_date

      t.timestamps
    end
  end
end
