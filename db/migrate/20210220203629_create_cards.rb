class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :content
      t.string :due_date
      t.belongs_to :list
      t.timestamps
    end
  end
end
